class My::ReportsController < ApplicationController
  def index
    @reports = current_user.all_reports
    @report = Report.find_by(id: params[:report_id]) || @reports.first
  end
end
