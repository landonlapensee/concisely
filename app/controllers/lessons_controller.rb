class LessonsController < ApplicationController
  def index
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    @lesson.save

    if @lesson.save
      redirect_to @lesson, notice: "Your lesson has been created"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def lessons_params
    params.require(:lesson).permit(:user_id, :description, :industry, :price) # is :user_id relevant ?
  end
end
