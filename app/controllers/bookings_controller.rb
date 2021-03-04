class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @lesson = Lesson.find(params[:lesson_id])
    @booking.duration = @lesson.duration || 30
    @booking.end_time = @booking.start_time.to_datetime + @lesson.duration.minutes
    @booking.lesson = @lesson
    @booking.price = @lesson.price
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :number_of_lessons)
  end
end
