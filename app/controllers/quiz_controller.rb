class QuizController < ApplicationController
  
before_action :current_player

  def index
    #will need to ensure that song has a preview_url -- in model, ActiveRecordQuerying - "SELECT * id FROM songs WHERE preview_url IS NOT NULL"
    @song = Song.find((252..452).to_a.sample)
    @album = @song.album
    
  end

  def update_score
    respond_to do |f|
      f.js { }
    end
  end
end

