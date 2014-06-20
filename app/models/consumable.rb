class Consumable < ActiveRecord::Base
	has_many :consumable_subcategories
	accepts_nested_attributes_for :consumable_subcategories, :reject_if => :all_blank, :allow_destroy => true
end
