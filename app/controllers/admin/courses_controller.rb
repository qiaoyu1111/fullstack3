class Admin::CoursesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_required

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @posts = @course.posts
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])

    if current_user != @course.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def update
    @course = Course.find(params[:id])

    if current_user != @course.user
      redirect_to root_path, alert: "You have no permission."
    end

    if @course.update(course_params)
      redirect_to admin_course_path
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

    if current_user != @course.user
      redirect_to root_path, alert: "You have no permission."
    end
    
    @course.destroy
    flash[:alert] = "Course deleted"
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :image, :is_hidden)
  end
end
