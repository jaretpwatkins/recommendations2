class Restaurant < ApplicationRecord

  has_many :recommendations, :dependent => :destroy
  belongs_to :neighborhood
  has_many :fans, :through => :recommendations, :source => :user
end
