class AddPublishedToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :published, :boolean
    add_index :lawyers, :published
  end
end
