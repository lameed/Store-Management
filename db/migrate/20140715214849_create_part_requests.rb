class CreatePartRequests < ActiveRecord::Migration
  def change
    create_table :part_requests do |t|

      t.timestamps
    end
  end
end
