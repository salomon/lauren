class PostsController < ApplicationController
  
  def index
  end

  def show
    @post = Post.where(id:params[:id]).first
  end

  def new
  	@post = Post.new
  end

  def create
    post = Post.create(title: params[:post][:title],
                sub_title: params[:post][:sub_title],
                content: params[:editor])
    redirect_to post_path(post.id)
  end

  def destroy
  end

  def edit
  end

  def update
  end

end