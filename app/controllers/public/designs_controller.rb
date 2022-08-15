class Public::DesignsController < ApplicationController
  def index

    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @designs = @genre.designs
    else
      @designs = Design.all
    end

  end

  def show
    @design = Design.find(params[:id])
  end
end
