class Lessons::AvailableTimesController < ApplicationController
  def index
    lesson = Lesson.find(params[:lesson_id])
    date = Date.parse(params[:date])
    @available_times = lesson.available_hours_params_for(date)
    render :index, layout: false
  end
end