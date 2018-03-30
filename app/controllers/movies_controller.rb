class MoviesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to root_url
    else
      @movies = current_user.movies.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def movie_params
    params.require(:movie).permit(:content)
  end
  
  def correct_user
    @movie = current_user.movies.find_by(id: params[:id])
    unless @movie
      redirect_to root_url
    end
  end  
end
