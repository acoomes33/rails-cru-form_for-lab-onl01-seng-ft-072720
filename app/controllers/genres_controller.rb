class GenresController < ApplicationController

    def show
        @genre = set_genre
    end 

    def new
        @genre = Genre.new
    end 

    def create
        @genre = Genre.new(post_params(:name))
        @genre.save
        redirect_to genre_path(@genre)
    end 

    def edit
        @genre = set_genre
    end 

    def update
        @genre = set_genre
        @genre.update(post_params(:name))
        redirect_to genre_path(@genre)
    end

    private

    def set_genre
        Genre.find(params[:id])
    end 

    def post_params(*args)
        params.require(:genre).permit(*args)
    end 

end
