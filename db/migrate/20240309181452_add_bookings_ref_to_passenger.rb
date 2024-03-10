class AddBookingsRefToPassenger < ActiveRecord::Migration[7.1]
  def change
    add_reference :passengers, :booking, foreign_key: true
  end
end
