class GuessController < ApplicationController
  before_action :current_player 

  def index
    if Song.find_by("name LIKE ?", "#{params[:guess].strip}%") 
      @guess = Song.find_by("name LIKE ?", "#{params[:guess].strip}%")
      @song = Song.find(params[:song_id])
      if @guess.id == @song.id
        current_player.add_point

          respond_to do |f|
            f.html { redirect_to }
            f.js { }
          end
      else
        current_player.subtract_point
        
        respond_to do |f|
          f.html { redirect_to }
          f.js { }
        end
        render "incorrect"
      end
    else
      current_player.subtract_point

      render "incorrect"
    end
  end

end
