class My::VideosController < ApplicationController
  def show
    if current_user.is_a_coach?
      @upcoming_booking = @upcoming_bookings.first
    raise 
    end 
  end 
end
