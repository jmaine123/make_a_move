class CreateMovees < ActiveRecord::Migration[5.2]
  def change
    create_table :movees do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.integer :age
      t.string :occupation
      t.string :email

      t.timestamps
    end
    add_index :movees, :email, unique: true
  end
end
