class CombineItemsInPartRequest < ActiveRecord::Migration
 def self.up
		# replace multiple items for a single product in a cart with a single item
		PartRequest.all.each do |part_request|
		# count the number of each product in the cart
		sums = part_request.part_line_items.group(:part_id).sum(:quantity)
		sums.each do |part_id, quantity|
		  if quantity > 1
			# remove individual items
			part_request.part_line_items.where(:part_id=>part_id).delete_all
			# replace with a single item
			part_request.part_line_items.create(:part_id=>part_id, :quantity=>quantity)
			end
   		  end
  		end
 	end

 	def self.down
# split items with quantity>1 into multiple items
PartLineItem.where("quantity>1" ).each do |partlineitem|
# add individual items
partlineitem.quantity.times do
PartLineItem.create :part_request_id=>partlineitem.part_request_id,
:part_id=>partlineitem.part_id, :quantity=>1
end
# remove original item
partlineitem.destroy
end
end
end
