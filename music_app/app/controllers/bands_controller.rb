class BandsController < ApplicationController

  def create
    @band = Band.new(band_params)
    if @band.save
      render plain: "Band Created"
    else
      flash.now(@band.errors.full_messages)
      render :new
    end
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    if @band
      render :show
    else
      render plain: "Band does not exist"
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      render plain: "Band updated"
    else
      flash.now(@band.errors.full_messages)
      render :show
    end
  end

  def index
    @bands = Band.all
    render :index
  end

  def destroy
    @band = Band.find(param[:id])
    @band.destroy
  end
  private

  def band_params
    params.require(:band).permit(:name)
  end

end
