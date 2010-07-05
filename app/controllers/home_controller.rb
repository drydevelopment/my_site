class HomeController < ApplicationController
  helper [HomeHelper, PostsHelper]
  def index
    @portfolios = Portfolio.find(:all, :conditions => { :is_featured => 1 }, :limit => 3)
    @posts = Post.find_published_posts(5)
  end

end
