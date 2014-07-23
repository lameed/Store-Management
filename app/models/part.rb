class Part < ActiveRecord::Base
	
	belongs_to :product
	has_many :manufacturers
	has_many :suppliers
	has_many :stores
	has_many :uses
	accepts_nested_attributes_for :manufacturers, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :suppliers, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :stores, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :uses, :reject_if => :all_blank, :allow_destroy => true

	mount_uploader :image_url, CarrierwaveUploader

	has_many :part_line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	
	validates :title, presence: true

	def ensure_not_referenced_by_any_line_item
		if part_line_items.count.zero?
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
