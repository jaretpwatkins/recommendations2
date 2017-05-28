class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
