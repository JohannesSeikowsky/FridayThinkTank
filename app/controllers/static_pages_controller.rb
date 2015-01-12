class StaticPagesController < ApplicationController
  def home
    @all_posts = Post.order("RANDOM()")
    @users = User.all
    @total_number_of_posts = Post.all.count
    @newest_posts = Post.order('created_at DESC').limit(3)
  end

  def about
  end
end
