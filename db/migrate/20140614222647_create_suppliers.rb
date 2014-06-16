class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :country
      t.belongs_to :part, index: true

      t.timestamps
    end
  end
end
