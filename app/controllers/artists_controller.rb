class ArtistsController < ApplicationController
  self.before_action :load_artists, only: [:show, :edit, :update, :destroy]

  def index
    @artist = Artist.all
    render(:index)
  end

  def show
    render(:show)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to("/artists/#{@artist.id}/songs")
  end

  def edit
    render(:edit)
  end

  def update
    @artist.update(artist_params)
    redirect_to("/artists/#{@artist.id}/songs")  
  end

  def destroy
    @artist.destroy
    redirect_to("/artists")
  end


  private

  def load_artists
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :photo_url)
  end

end
