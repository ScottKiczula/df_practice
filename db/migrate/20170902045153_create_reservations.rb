class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :table_id, null: false
      t.integer :customer_id, null: false
      t.datetime :time, uniqueness: true 

      t.timestamps null: false
    end
  end
end
