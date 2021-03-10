class My::ReportsController < ApplicationController
  def index
    @reports = current_user.all_reports
  end
end
