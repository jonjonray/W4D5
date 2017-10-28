class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def index
    @tracks = Track.all
    render :index
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      render :index
    else
      flash.now(@track.errors.full_messages)
      render :new
    end
  end

  def new
    @albums = Album.all
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to tracks_url
    else
      flash.now[@track.errors.full_messages]
    end
  end

  def destroy
    @track.find(params[:id])
    @track.destroy
    redirect_to tracks_url
  end

  private

  def track_params
    params.require(:track).permit(:title, :ord, :album_id, :bonus, :lyrics)
  end
end
