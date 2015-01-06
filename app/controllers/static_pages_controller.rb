class StaticPagesController < ApplicationController
  def home
    @all_posts = Post.all
  end

  def other_page
  end
end
