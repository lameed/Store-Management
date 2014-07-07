class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	validates :name, :email, :presence => true

	def add_line_items_from_request(request)
		request.line_items.each do |item|
		item.request_id = nil
		line_items << item
	end
	end
end
