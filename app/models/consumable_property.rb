class ConsumableProperty < ActiveRecord::Base
  belongs_to :consumable_subcategory
  mount_uploader :drawing, CarrierwaveUploader
end
