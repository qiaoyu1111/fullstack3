class Admin::PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @course = Course.find(params[:course_id])
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @posts = @post.posts
  end

  def create
    @course = Course.find(params[:course_id])
    @post.user = current_user
    @post = Post.new(post_params)


    if @post.save
      redirect_to admin_course_path(@course)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
