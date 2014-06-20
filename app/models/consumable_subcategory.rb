class ConsumableSubcategory < ActiveRecord::Base
  belongs_to :consumable
  has_many :consumable_uses
  accepts_nested_attributes_for :consumable_uses, :reject_if => :all_blank, :allow_destroy => true
end
