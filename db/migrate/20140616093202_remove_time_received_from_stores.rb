class RemoveTimeReceivedFromStores < ActiveRecord::Migration
  def change
    remove_column :stores, :time_received, :string
  end
end
