class CreateMovingEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :moving_events do |t|
      t.string :name
      t.string :old_location
      t.string :new_location
      t.text :description
      t.integer :amount_of_furniture
      t.string :difficulty
      t.integer :movers_needed
      t.text :movers_list
      t.date :start_time
      t.date :end_time
      t.references :movee

      t.timestamps
    end
  end
end
