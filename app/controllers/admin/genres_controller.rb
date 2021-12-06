class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def show
  end

  def edit
     @genre = Genre.find(params[:id])
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def update
  end

end

 private
  def genre_params
    params.permit(:title)
  end