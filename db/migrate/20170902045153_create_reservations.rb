class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name, null: false
      t.integer :guests, null: false
      t.integer :table_id, null: false
      t.datetime :time

      t.timestamps null: false
    end
  end
end
