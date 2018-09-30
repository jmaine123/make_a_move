class AddLatitudeToMovees < ActiveRecord::Migration[5.2]
  def change
    add_column :movees, :latitude, :float
  end
end
