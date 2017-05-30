class AddNeighborhoodIdToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :neighborhood_id, :integer
  end
end
