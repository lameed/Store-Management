class AddPartToManufacturer < ActiveRecord::Migration
  def change
    add_column :manufacturers, :part, :belong_to
  end
end
