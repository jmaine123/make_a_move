class CreateMovingEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :moving_events do |t|
      t.string :name
      t.string :old_location_street
      t.string :old_location_city
      t.string :old_location_state
      t.string :new_location_street
      t.string :new_location_city
      t.string :new_location_state
      t.text :description
      t.integer :amount_of_furniture
      t.string :difficulty
      t.integer :movers_needed
      t.date :start_date
      t.string :start_time
      t.integer :estimate_hours
      t.integer :payment_per_hour
      t.boolean :giveaways
      t.references :movee

      t.timestamps
    end
  end
end
