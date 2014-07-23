class Product < ActiveRecord::Base
	
	paginates_per 1
	has_many :subcategories
	has_many :properties
	has_many :parts, dependent: :destroy
	has_many :line_items
	has_many :orders, :through => :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	
	validates :title, presence: true

	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors[:base] << "Line Items present"
			return false
		end
	end

	def self.search(search)
		if search
			where('title Like ?' , "%#{search}%")
		else
			all
		end
	end
end
