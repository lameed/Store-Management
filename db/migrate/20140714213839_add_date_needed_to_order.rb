class AddDateNeededToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :date_needed, :datetime
  end
end
