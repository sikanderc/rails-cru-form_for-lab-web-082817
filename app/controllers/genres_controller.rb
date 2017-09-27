class GenresController < ApplicationController

    def index
      @genres = Genre.all
    end

    def new
      @genre = Genre.new
    end

    def show
      @genre = Genre.find(params[:id])
    end

    def create
      @genre = Genre.new(genre_params)
      if @genre.valid?
        @genre.save
        redirect_to genre_path(@genre)
      else
        render :'new.html'
      end
    end

    def update
      @genre = Genre.find(params[:id])
      if @genre.update(genre_params)
        redirect_to genre_path(@genre)
      else
        render :'edit.html'
      end
    end

    def edit
      @genre = Genre.find(params[:id])
    end

    def destroy
      @genre = Genre.find(params[:id])
      @genre.destroy
      redirect_to :genres
    end

    private

    def genre_params
      params.require(:genre).permit(:name)
    end

  end
