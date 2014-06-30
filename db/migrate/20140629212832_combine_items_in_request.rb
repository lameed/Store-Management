class CombineItemsInRequest < ActiveRecord::Migration
  def self.up
  	Request.all.each do |request|
  		sums = request.line_items.group(:product_id).sum(:quantity)

  		sums.each do |product_id, quantity|
  			if quantity > 1
  				request.line_items.where(:product_id=>product_id).delete_all

  				request.line_items.create(:product_id=>product_id, :quantity=>quantity)
  			end
  		end
  	end
  end

  def self.down
	# split items with quantity>1 into multiple items
	LineItem.where("quantity>1" ).each do |lineitem|
	# add individual items
	lineitem.quantity.times do
	LineItem.create :request_id=>lineitem.request_id,
	:product_id=>lineitem.product_id, :quantity=>1
	end
	# remove original item
	lineitem.destroy
	end
	end
end
