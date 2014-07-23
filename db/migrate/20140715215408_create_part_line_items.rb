class CreatePartLineItems < ActiveRecord::Migration
  def change
    create_table :part_line_items do |t|
      t.integer :part_id
      t.integer :part_request_id

      t.timestamps
    end
  end
end
