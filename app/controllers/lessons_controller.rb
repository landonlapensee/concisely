class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all

    if params[:category].present?
      @lessons = Lesson.where(category: params[:category])
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
