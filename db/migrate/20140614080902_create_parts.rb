class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :title
      t.string :number
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
