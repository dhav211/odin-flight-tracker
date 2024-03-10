class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by id: params[:flight_id]
    @passenger_count = params[:passengers].to_i
    @booking = Booking.new
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new allowed_params
    @flight = @booking.flight

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find_by id: params[:id]
    @passengers = @booking.passengers
  end

  private

  def allowed_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
