class Admin::CoursesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:alert] = "Course deleted"
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :image, :is_hidden)
  end
end
