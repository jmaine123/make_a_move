class AddLatitudeToMovingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :moving_events, :latitude, :float
  end
end
