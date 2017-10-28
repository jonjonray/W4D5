class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def index
    @albums = Album.all
    render :index
  end

  def create
    @album = Album.new(album_params)
    @bands = Band.all
    if @album.save
      render :index
    else
      flash.now(@album.errors.full_messages)
      render :new
    end
  end

  def new
    @bands = Band.all
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_url
    else
      flash.now[@album.errors.full_messages]
    end
  end

  def destroy
    @album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end


  private

  def album_params
    params.require(:album).permit(:title,:year,:studio_album,:band_id)
  end
end
