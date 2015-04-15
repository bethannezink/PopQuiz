class QuizController < ApplicationController
before_action :current_player
  def index
    #will need to ensure that song has a preview_url -- in model, ActiveRecordQuerying - "SELECT * id FROM songs WHERE preview_url IS NOT NULL"
    @song = Song.find((252..452).to_a.sample)
    @album = @song.album
    
    # @num = rand(1..29)
    # can change difficulty level if desired 
  end
end
