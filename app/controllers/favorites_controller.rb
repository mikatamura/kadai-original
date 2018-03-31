class FavoritesController < ApplicationController
  before_action :require_user_logged_in, :set_movie
  
  def create
    current_user.like(@movie)
    flash[:success] = 'お気に入り登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.dislike(@movie)
    flash[:success] = "お気に入り解除しました."
    redirect_back(fallback_location: root_path)
  end
  
  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
