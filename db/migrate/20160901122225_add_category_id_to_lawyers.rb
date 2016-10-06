class AddCategoryIdToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :category_id, :integer
  end
end
