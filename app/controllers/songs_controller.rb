class SongsController < ApplicationController

  # self.before_action :load_artist
  # self.before_action :load_song :only [:edit, :update, :destroy]

  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.all
    render(:index)
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.find(params[:id])
    render(:show)
  end

  def new
    @artist = Artist.find(params[:artist_id])
    render(:new)
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @artist.songs.create(title: params[:title], year: params[:year])
    redirect_to("/artists/#{@artist.id}/songs")
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    render(:edit)
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    @song.update(title: params[:title], year: params[:year])
    redirect_to("/artists/#{@artist.id}/songs")  
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
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
    return {
      title: params[:title],
      year: params[:year],
      artist_id: params[:artist_id]
    }
  end

end