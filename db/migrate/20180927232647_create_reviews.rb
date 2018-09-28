class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :mover_rating
      t.references :mover

      t.timestamps
    end
  end
end
