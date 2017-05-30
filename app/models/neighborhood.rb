class Neighborhood < ApplicationRecord

  has_many :restaurants
  has_many :recommendations, :through => :restaurants

end
