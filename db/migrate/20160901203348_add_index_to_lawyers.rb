class AddIndexToLawyers < ActiveRecord::Migration
  def change
    add_index :lawyers, :name
    add_index :lawyers, :email
    add_index :lawyers, :category_id
    #add_index :lawyers, :subcategory_id
    add_index :lawyers, :phone_number
  end
end
