class LinesController < ApplicationController

  def index
    @lines = Line.all
    @line = Line.new
  end


  def create
    @line = Line.new(line_params)
    if @line.save
      flash[:notice] = "Bus line created."
      redirect_to('/lines')
    else
      render('/lines')
    end
  end

  def show
    @line = Line.find(params[:id])
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
