class CommentsController < ApplicationController

	def create
  comment = Comment.create(name: params[:comment][:name],
                           email: params[:comment][:email],
                           post_id: params[:post_id],
                           content: params[:comment][:content])
  redirect_to post_path(params[:post_id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def approved
	end

end

