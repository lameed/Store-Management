class CreateConsumableUses < ActiveRecord::Migration
  def change
    create_table :consumable_uses do |t|
      t.text :project
      t.text :comment
      t.belongs_to :consumable_subcategory, index: true

      t.timestamps
    end
  end
end
