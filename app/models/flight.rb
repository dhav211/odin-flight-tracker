class Flight < ApplicationRecord
  belongs_to :departing_airport, class_name: 'Airport'
  belongs_to :arriving_airport, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings

  # Gives the flight a readable name such as SEA > PDX at 5:43 AM
  def name
    "#{departing_airport.code} > #{arriving_airport.code} - #{start_time.strftime('%A %-m/%-d/%Y at %l:%M%p')}"
  end
end
