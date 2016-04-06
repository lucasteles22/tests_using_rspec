class HomeController < ApplicationController
  def index
    @users_count = User.count
    @posts_count = Post.count
  end
end
