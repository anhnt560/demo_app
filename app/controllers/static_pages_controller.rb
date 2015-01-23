class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      #@current_feed_items = current_user.feed.paginate(page: params[:page])
    end
    posts = Micropost.all
    @feed_items = posts.paginate(page: params[:page])
  end

  def help
  end

  def about
  end
end