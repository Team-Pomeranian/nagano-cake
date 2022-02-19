class Admin::GenresController < ApplicationController

  def index
    @genre_new = Genre.new
    @genres = Genre.all
  end

  def create
    @genre_new = Genre.new(genre_params)
    @genre_new.save
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  private

  def genre_params
    params.permit(:name)
  end

end
