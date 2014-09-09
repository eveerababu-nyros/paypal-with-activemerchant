class Product < ActiveRecord::Base
  attr_accessible :cost, :name
  has_many :purchases
  	
end
