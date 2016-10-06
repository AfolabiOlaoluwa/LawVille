class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string   :name
      t.string   :image
      t.string   :title
      t.string   :email, :default => "", :null => false
      t.integer  :phone_number
      t.text     :professional_details
      t.string   :website     #, :default => "", :null => false
      t.string   :twitter_link
      t.string   :linkedin_link
      #t.string   :speaker_clients

      t.timestamps null: false
    end
  end
end
