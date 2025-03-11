class BookingsController < ApplicationController
  before_action :set_dog, only: :create
  before_action :set_booking, only: [:accept, :decline]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog

    if @booking.save
      redirect_to dashboard_path, notice: "Booking request sent!"
    else
      render "dogs/show", status: :unprocessable_entity
    end
  end

  def accept
    @booking.update(status: "accepted")
    redirect_to dashboard_path, notice: "Booking accepted!"
  end

  def decline
    @booking.update(status: "declined")
    redirect_to dashboard_path, notice: "Booking declined."
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
