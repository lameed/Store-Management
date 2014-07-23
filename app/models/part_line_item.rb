class PartLineItem < ActiveRecord::Base
	belongs_to :part
	belongs_to :part_request
end
