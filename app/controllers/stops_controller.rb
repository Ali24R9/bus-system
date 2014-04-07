class StopsController < ApplicationController

  def index
    @stops = Stop.all
    @stations = Station.new
    @station = Station.new
  end

  def create
    @stop = Stop.create(stop_params)
    if @stop.save
      flash[:notice] ="Stop created"
      redirect_to('/stops')
    else
      render('/stops')
    end
  end

  def show
    @stop = Stop.find(params[:id])
  end

  def edit
    @stop = Stop.find(params[:id])
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    flash[:notice] = "Stop deleted."
    redirect_to stops_path
  end

  def update
    @stop = Stop.find(params[:id])
    if @stop.update(stop_params)
      flash[:notice] = "stop edited"
      redirect_to('/stops')
    else
      render('/stops')
    end
  end

private
  def stop_params
    params.require(:stop).permit(:station_id, :line_id)
  end
end
