class PagesController < ApplicationController
  def home
   @dogs = Dog.all
  end

  def dashboard
    @my_dogs = current_user.dogs
    @received_bookings = Booking.joins(:dog).where(dogs: { user: current_user })
    @my_bookings = current_user.bookings
  end
end
