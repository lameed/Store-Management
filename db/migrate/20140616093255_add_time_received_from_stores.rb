class AddTimeReceivedFromStores < ActiveRecord::Migration
  def change
    add_column :stores, :time_received, :datetime
  end
end
