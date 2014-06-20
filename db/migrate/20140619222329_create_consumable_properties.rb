class CreateConsumableProperties < ActiveRecord::Migration
  def change
    create_table :consumable_properties do |t|
      t.string :name
      t.string :manufacturer
      t.string :designer
      t.text :description
      t.datetime :date_ordered
      t.datetime :date_supplied
      t.string :unit_weight
      t.string :length
      t.string :drawing
      t.belongs_to :consumable_subcategory, index: true

      t.timestamps
    end
  end
end
