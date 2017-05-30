class RemoveNeighborhoodFromRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :neighborhood, :string
  end
end
