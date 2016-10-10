class AddOwnerToPayolaSale < ActiveRecord::Migration
  def change
    add_column :payola_sales, :owner_id, :integer
    add_column :payola_sales, :owner_type, :string

    add_index :payola_sales, [:owner_id, :owner_type]
  end
end
