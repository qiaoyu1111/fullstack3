class CoursesController < ApplicationController
  def index
    @courses = Course.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @course = Course.find(params[:id])
    @posts = @course.posts
  end
end
