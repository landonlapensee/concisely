class My::DashboardsController < ApplicationController
  def show
    if current_user.is_a_coach?
      my_bookings = current_user.bookings.all
      @my_listings = current_user.lessons.all
      @my_listing_bookings = @my_listings.map do |listing|
        listing.bookings.all
      end
      @my_bookings = my_bookings + @my_listings
      raise
    else
      @my_bookings = current_user.bookings.all
    end
  end
end
