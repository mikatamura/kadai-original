class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @movie = current_user.movies.build  # form_for 用
      @movies = current_user.movies.order('created_at DESC').page(params[:page])
    end
  end
end