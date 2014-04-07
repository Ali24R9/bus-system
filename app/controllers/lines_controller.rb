class LinesController < ApplicationController

  def index
    @lines = Line.all
    @line = Line.new
    @stations = Station.all
    @station = Station.new
    @stop = Stop.new
    @stops = Stop.all
  end


  def create
    @line = Line.create(line_params)
    @line.stops.create(stop_params)

    if @stop.save
      flash[:notice] ="Stop created"
      redirect_to('/stops')
    else
      render('/stops')
    end
    if @line.save
      flash[:notice] = "Bus line created."
      redirect_to('/lines')
    else
      render('/lines')
    end
  end

  def show
    @line = Line.find(params[:id])
    @stops = @line.stops
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      flash[:notice] = "Bus line edited"
      redirect_to('/lines')
    else
      render('/lines')
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "Line deleted."
    redirect_to lines_path
  end

private
  def line_params
    params.require(:line).permit(:line_number)
  end
end
