class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :location
      t.string :store_keeper
      t.string :quantity
      t.string :time_received
      t.belongs_to :part, index: true

      t.timestamps
    end
  end
end
