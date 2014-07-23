class PartRequest < ActiveRecord::Base
	has_many :part_line_items, :dependent => :destroy


	def add_part(part_id)
		current_item = part_line_items.where(:part_id => part_id).first
		if current_item
		current_item.quantity += 1
		else
		current_item = PartLineItem.new(:part_id=>part_id)
		part_line_items << current_item
		end
		current_item
		end
end
