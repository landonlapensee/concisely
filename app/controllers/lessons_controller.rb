class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lessons = Lesson.all

    if params[:industry].present?
      @lessons = Lesson.where(industry: params[:industry])
    end
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
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)

    redirect_to @lesson, notice: "Your lesson has been edited"
  end

  def destroy
  end

  private

  def lesson_params
    params.require(:lesson).permit(:description, :industry, :price)
  end
end
