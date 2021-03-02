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
    @booking.lesson = @lesson
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end
  
  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
