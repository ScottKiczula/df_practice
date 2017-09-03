class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :table_id, null: false
      t.string :name, null: false
      t.integer :guest, null: false
      t.datetime :time, uniqueness: true 

      t.timestamps null: false
    end
  end
end
