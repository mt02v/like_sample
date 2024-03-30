class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_parans)
    @post.user_id = current_usr.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

private
  def post_params
    params.require(:post).permit(:content)
  end 
end