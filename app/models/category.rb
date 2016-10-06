class Category < ActiveRecord::Base
  has_many :lawyers
  has_many :sub_categories, class_name: "Category", foreign_key: :parent_id


  validates :name, presence: true

  #here is the scope that is suggested
  scope :top_level, -> { where(parent_id: nil).includes :lawyers, sub_categories: :lawyers }


end

