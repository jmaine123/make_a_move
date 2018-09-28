class AddLatitudeToMovers < ActiveRecord::Migration[5.2]
  def change
    add_column :movers, :latitude, :float
  end
end
