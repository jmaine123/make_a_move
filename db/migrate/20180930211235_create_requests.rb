class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :status
      t.references :mover, foreign_key: true
      t.references :moving_event, foreign_key: true

      t.timestamps
    end
  end
end
