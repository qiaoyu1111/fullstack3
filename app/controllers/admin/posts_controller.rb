class Admin::PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @course = Course.find(params[:course_id])
    @post = Post.new
  end

  def show
    @course = Course.find(params[:id])
    @posts = @course.posts
  end

  def create
    @course = Course.find(params[:course_id])
    @post = Post.new(post_params)
    @post.user = current_user


    if @post.save
      redirect_to admin_course_path(@course)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end
end
