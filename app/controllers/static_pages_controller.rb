class StaticPagesController < ApplicationController
  def home
    @all_posts = Post.order("RANDOM()")
    @users = User.all
  end

  def about
  end
end
