class CreateConsumableSubcategories < ActiveRecord::Migration
  def change
    create_table :consumable_subcategories do |t|
      t.string :name
      t.text :description
      t.belongs_to :consumable, index: true

      t.timestamps
    end
  end
end
