class AddLongitudeToMovees < ActiveRecord::Migration[5.2]
  def change
    add_column :movees, :longitude, :float
  end
end
