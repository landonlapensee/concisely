class ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
    @bookings = current_user.bookings
  end 

  def new 
    @booking = Booking.find(params[:booking_id])
    @report = Report.new(content: render_to_string(partial: "content_template"))
  end 

  def create
    @booking = Booking.find(params[:booking_id])
    # if current_user.can_create_a_report_for?(@booking)
    @report = Report.new(report_params)
    @report.booking = @booking
    if @report.save
      redirect_to my_bookings_path, notice: 'Report was successfully submitted.'
    else
      render :new, notice: 'Error, Report was not created'
    end
  end 

  private

  def report_params
    params.require(:report).permit(:content, :rating, :date)
  end
end
