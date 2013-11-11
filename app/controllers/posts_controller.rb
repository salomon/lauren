class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.where(id:params[:id]).first
  end

  def new
    if current_user && current_user.writer == true
      @post = Post.new
    else
      redirect_to root_path
    end
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
    if current_user && current_user.writer == true
      @post = Post.where(id:params[:id]).first
    else
      redirect_to root_path
    end
  end

  def update
    @post = Post.where(id:params[:id]).first
    @post.update_attributes(title: params[:post][:title],
                       sub_title: params[:post][:sub_title],
                       content: params[:editor])
    redirect_to post_path(@post.id)
  end

  def publish
    @post = Post.where(id:params[:id]).first
    @post.publish
    redirect_to post_path(@post.id)
  end

  def unpublish
    @post = Post.where(id:params[:id]).first
    @post.unpublish
    redirect_to post_path(@post.id)
  end

end