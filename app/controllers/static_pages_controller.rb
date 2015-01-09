class StaticPagesController < ApplicationController
  def home
    @all_posts = Post.all
    @users = User.all
    @character_number = rand(5..30)
  end

  def about
  end
end
