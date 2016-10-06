class AddTokenToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :token, :string
    add_index :lawyers, :token
  end
end
