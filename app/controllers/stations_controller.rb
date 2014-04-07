class StationsController < ApplicationController

  def index
    @stations = Station.all
    @station = Station.new
  end

  def create
    @station = Station.create(station_params)
    if @station.save
      flash[:notice] ="Bus station station."
      redirect_to('/lines')
    else
      render('/stations')
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  def edit
    @station = Station.find(params[:id])
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "Station deleted."
    redirect_to lines_path
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      flash[:notice] = "bus station edited"
      redirect_to('/lines')
    else
      render('/lines')
    end
  end

private
  def station_params
    params.require(:station).permit(:station_name)
  end
end
