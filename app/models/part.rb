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
end
