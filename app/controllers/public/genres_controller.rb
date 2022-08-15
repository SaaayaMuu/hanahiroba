class Public::GenresController < ApplicationController

  def index
    @design1 = Design.where(genre_id: 1).limit(4)
    @design2 = Design.where(genre_id: 2).limit(4)
    @design4 = Design.where(genre_id: 4).limit(4)

  end
end
