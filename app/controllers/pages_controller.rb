class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
   @dogs = Dog.all
  end

  def dashboard
    @bookings_as_client = current_user.bookings
    @bookings_as_owner = Booking.joins(:dog).where(dogs: { user: current_user })
  end
end
