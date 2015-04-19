class QuizController < ApplicationController
  
before_action :current_player

  def index
    @song = Song.where("preview_url IS NOT NULL").sample
    @artist = @song.artist
    @album = @song.album
  end

end

