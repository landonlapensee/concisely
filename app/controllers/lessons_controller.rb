class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lessons = Lesson.all

    if params[:industry].present?
      @lessons = Lesson.where(industry: params[:industry])
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
