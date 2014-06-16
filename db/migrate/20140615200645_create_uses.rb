class CreateUses < ActiveRecord::Migration
  def change
    create_table :uses do |t|
      t.belongs_to :part, index: true
      t.text :description

      t.timestamps
    end
  end
end
