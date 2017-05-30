class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :latitude
      t.string :longitude

      t.timestamps

    end
  end
end
