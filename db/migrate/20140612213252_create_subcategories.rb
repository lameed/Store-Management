class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.references :product, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
