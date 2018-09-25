class CreateMovers < ActiveRecord::Migration[5.2]
  def change
    create_table :movers do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.integer :age
      t.string :email
      t.integer :rating
      t.integer :karma_points
      t.string :occupation
      t.text :bio
      t.references :moving_event, foreign_key: true
      t.references :movee, foreign_key: true

      t.timestamps
    end
    add_index :movers, :email, unique: true
  end
end
