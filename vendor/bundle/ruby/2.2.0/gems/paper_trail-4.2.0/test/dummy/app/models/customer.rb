class Customer < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  has_paper_trail
end
