class AddQuantityToPartLineItem < ActiveRecord::Migration
  def change
    add_column :part_line_items, :quantity, :integer,:default => 1
  end
end
