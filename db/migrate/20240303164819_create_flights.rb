class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.integer :duration
      t.datetime :start_time
      t.integer :departing_airport_id
      t.integer :arriving_airport_id

      t.timestamps
    end
  end
end
