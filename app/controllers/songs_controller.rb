class SongsController < ApplicationController

  self.before_action :load_artist
  self.before_action :load_song, only: [:edit, :update, :destroy]

  def index
    @songs = @artist.songs.all
    render(:index)
  end

  def show
    @songs = @artist.songs.find(params[:id])
    render(:show)
  end

  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.create(song_params)
    @song.preview_url = get_preview_url(@artist.name, @song.title)
    @song.save

    redirect_to artist_path(@artist)
  end

  def edit
    render(:edit)
  end

  def update
    @song.update(song_params)  
    redirect_to artist_path(@artist)
  end

  def destroy
    @song.destroy
    redirect_to("/artists/#{@artist.id}/songs")
  end

  private

  def load_artist
    return @artist = Artist.find(params[:artist_id])
  end

  def load_song
    return @song = @artist.songs.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year)
  end

  def get_preview_url(artist, song)
    artist = artist.gsub(" ", "+")
    song = song.gsub(" ", "+")
    from_itunes = HTTParty.get("http://itunes.apple.com/search?term=#{artist}+#{song}&media=music&entity=musicTrack&limit=1")
    from_itunes_as_hash = JSON(from_itunes)
    return from_itunes_as_hash["results"][0]["previewUrl"]
  end





end