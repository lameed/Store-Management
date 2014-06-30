class Product < ActiveRecord::Base
	has_many :subcategories
	has_many :properties
	has_many :parts, dependent: :destroy
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	accepts_nested_attributes_for :subcategories, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :properties, :reject_if => :all_blank, :allow_destroy => true
	validates :title, presence: true

	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors[:base] << "Line Items present"
			return false
		end
	end
end
