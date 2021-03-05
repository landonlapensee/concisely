class My::BookingsController < ApplicationController
  def index
    if current_user.is_a_coach?
      my_bookings = current_user.bookings
      my_listings = current_user.lessons
      my_listing_bookings = my_listings.map { |listing| listing.bookings }.flatten
      @my_bookings = my_bookings + my_listing_bookings
    else
      @my_bookings = current_user.bookings
    end
    sorted_bookings = @my_bookings.sort { |x| x.end_time }
    @upcoming_booking = sorted_bookings.find { |b| b.end_time >= Time.now }
  end
end
