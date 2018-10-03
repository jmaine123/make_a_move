class CreateGiveaways < ActiveRecord::Migration[5.2]
  def change
    create_table :giveaways do |t|
      t.string :item_name
      t.string :condition
      t.references :moving_event, foreign_key: true

      t.timestamps
    end
  end
end
