class CreateOrderPositions < ActiveRecord::Migration[4.2]
  def change
    create_table :order_positions do |t|
      t.integer :index
      t.integer :owner_id
      t.string :owner_type
    end

    add_index :order_positions, :index
    add_index :order_positions, :owner_id
    add_index :order_positions, :owner_type
  end
end
