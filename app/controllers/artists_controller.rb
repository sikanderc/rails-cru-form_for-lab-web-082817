class ArtistsController < ApplicationController

    def index
      @artists = Artist.all
    end

    def new
      @artist = Artist.new
    end

    def show
      @artist = Artist.find(params[:id])
    end

    def create
      @artist = Artist.new(artist_params)
      if @artist.valid?
        @artist.save
        redirect_to artist_path(@artist)
      else
        render :'new.html'
      end
    end

    def update
      @artist = Artist.find(params[:id])
      if @artist.update(artist_params)
        redirect_to artist_path(@artist)
      else
        render :'edit.html'
      end
    end

    def edit
      @artist = Artist.find(params[:id])
    end

    def destroy
      @artist = Artist.find(params[:id])
      @artist.destroy
      redirect_to :artists
    end

    private

    def artist_params
      params.require(:artist).permit(:name, :bio)
    end

  end
