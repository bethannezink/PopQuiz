class QuizController < ApplicationController
  
before_action :current_player

  def index
    #will need to ensure that song has a preview_url -- in model, ActiveRecordQuerying - "SELECT * id FROM songs WHERE preview_url IS NOT NULL"
    @song = Song.find((Song.where("preview_url IS NOT NULL")).sample)
    @artist = @song.artist
    @album = @song.album
  end

end

