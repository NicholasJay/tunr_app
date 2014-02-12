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
    @artist.songs.create(song_params)
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

end