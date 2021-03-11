class My::VideosController < ApplicationController
  def show
    @bookings = Booking.all
    @booking = @bookings.where(id: params[:booking_id])
    if current_user.is_a_coach?
      @coach = true;
    end
  end 
end
