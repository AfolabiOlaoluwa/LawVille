class ChangeIntegerLimitInLawyers < ActiveRecord::Migration
  def change
    change_column :lawyers, :phone_number, :integer, limit: 8
  end
end
