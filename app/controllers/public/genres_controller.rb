class Public::GenresController < ApplicationController

  def index
    @design1 = Design.where(genre_id: 1).limit(4)#髪飾り
    @design2 = Design.where(genre_id: 6).limit(4)#インテリア
    @design4 = Design.where(genre_id: 4).limit(4)#アクセサリー

  end
end
