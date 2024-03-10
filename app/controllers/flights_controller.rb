class FlightsController < ApplicationController
  def index
    @airports_choices = Airport.all.map { |airport| [airport.code, airport.id] }
    @earliest_date = Flight.minimum('start_time')
    @latest_date = Flight.maximum('start_time')
    @results = user_selected_flight_details? ? set_results : nil
  end

  private

  def user_selected_flight_details?
    !params[:departing_airport_id].nil? && !params[:arriving_airport_id].nil? && !params[:date].nil?
  end

  def set_results
    {
      flights: Flight.where(
        departing_airport_id: params[:departing_airport_id],
        arriving_airport_id: params[:arriving_airport_id],
        start_time: params[:date].to_datetime.all_day
      ),
      passenger_count: params[:passenger_count]
    }
  end
end
