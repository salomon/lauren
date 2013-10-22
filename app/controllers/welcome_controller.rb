class WelcomeController < ApplicationController
  def index
  	@all = Post.all
  	@posts = @all.sort_by{|post| post.updated_at}.reverse
  end
end
