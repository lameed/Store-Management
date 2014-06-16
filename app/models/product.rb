class Product < ActiveRecord::Base
	has_many :subcategories
	has_many :properties
	has_many :parts, dependent: :destroy
	accepts_nested_attributes_for :subcategories, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :properties, :reject_if => :all_blank, :allow_destroy => true
	validates :title, presence: true
end
