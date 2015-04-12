class SpotifyService

  def dev_key
    ENV["spotify_key"]
  end

  def get_top_songs
    data = JSON.parse(open("http://charts.spotify.com/api/tracks/most_streamed/us/daily/latest").read)
    data["tracks"]
  end

  def get_all_top_song_ids
    get_top_songs.collect do |song|
      song["track_url"].slice(31, 22)
    end
  end

  def get_song_ids(song_range)
    get_all_top_song_ids[song_range].join(",")
  end

  def get_track_info(song_range)
    data = JSON.parse(open("https://api.spotify.com/v1/tracks?ids=#{get_song_ids(song_range)}").read)
    data["tracks"]
  end

  def build_songs(song_range)
    get_track_info(song_range).each do |song|
      songy = Song.new
      songy.name = song["name"]
      songy.artist = song["artists"][0]["name"]
      songy.full_song_url = song["external_urls"]["spotify"]
      songy.preview_url = song["preview_url"]
      songy.album = Album.find_or_create_by(:name => song["album"]["name"], :full_album_url => song["album"]["external_urls"]["spotify"], :image_url => song["album"]["images"][1]["url"])
      songy.save
    end
  end

end
