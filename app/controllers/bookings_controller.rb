class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :decline]

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = @dog.bookings.build(user: current_user, start_date: params[:start_date], end_date: params[:end_date], status: "pending")

    if @booking.save
      redirect_to dashboard_path, notice: "Booking request sent!"
    else
      redirect_to @dog, alert: "Error in booking."
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

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
