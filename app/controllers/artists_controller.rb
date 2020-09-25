class ArtistsController < ApplicationController

    def show
        @artist = set_artist
    end 

    def new
        @artist = Artist.new
    end 

    def create
        @artist = Artist.new(post_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end 

    def edit
        @artist = set_artist
    end 

    def update
        @artist = set_artist
        @artist.update(post_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def set_artist
        Artist.find(params[:id])
    end 

    def post_params(*args)
        params.require(:artist).permit(*args)
    end 

end
