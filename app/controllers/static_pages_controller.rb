class StaticPagesController < ApplicationController
  def home
    @all_posts = Post.all
    @users = User.all
  end

  def other_pages
  end
end
