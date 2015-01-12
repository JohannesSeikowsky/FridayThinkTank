class StaticPagesController < ApplicationController
  def home
    @all_posts = Post.order("RANDOM()")
    @users = User.all
    @total_number_of_posts = Post.all.count
  end

  def about
  end
end
