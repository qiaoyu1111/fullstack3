class Admin::PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @course = Course.find(params[:course_id])
    @post = Post.new
  end

  def create
    @course = Course.find(params[:course_id])
    @post = Post.new(post_params)
    @post.course = @course
    @post.user = current_user

    if @post.save
      redirect_to admin_courses_path
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end
