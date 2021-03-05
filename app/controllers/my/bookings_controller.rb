class My::BookingsController < ApplicationController
  def index
    if current_user.is_a_coach?
      my_bookings = current_user.bookings.all
      @my_listings = current_user.lessons.all
      @my_listings.each do |listing|
        @my_listing_bookings = listing.bookings.all.each do |booking|
          booking
        end
      end
      @my_bookings = my_bookings + @my_listing_bookings
    else
      @my_bookings = current_user.bookings.all
    end
  end
end
