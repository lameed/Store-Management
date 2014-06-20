class CreateConsumables < ActiveRecord::Migration
  def change
    create_table :consumables do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
