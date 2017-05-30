class Recommendation < ApplicationRecord
validates :user_id, :presence => true, :uniqueness => { :scope => :restaurant_id }
validates :restaurant_id, :presence => true

belongs_to :user
belongs_to :restaurant
end
