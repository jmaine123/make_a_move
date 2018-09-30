class AddLongitudeToMovers < ActiveRecord::Migration[5.2]
  def change
    add_column :movers, :longitude, :float
  end
end
