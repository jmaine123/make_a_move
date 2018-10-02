class AddPriceToMovingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :moving_events, :price, :integer
  end
end
