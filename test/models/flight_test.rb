require "test_helper"

class FlightTest < ActiveSupport::TestCase
  test 'flight name is correct' do
    pdx = Airport.new code: 'PDX'
    sea = Airport.new code: 'SEA'
    flight = Flight.new(
      duration: 1,
      start_time: DateTime.new(2024, 3, 6, 10, 23),
      arriving_airport: pdx,
      departing_airport: sea
    )

    assert_equal 'SEA > PDX - Wednesday 3/6/2024 at 10:23AM', flight.name
  end
end
