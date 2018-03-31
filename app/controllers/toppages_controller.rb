class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @movie = current_user.movies.build 
      @movies = current_user.feed_movies.order('created_at DESC').page(params[:page])
    end
  end
end