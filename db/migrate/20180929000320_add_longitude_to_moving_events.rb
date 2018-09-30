class AddLongitudeToMovingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :moving_events, :longitude, :float
  end
end
