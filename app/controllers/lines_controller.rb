class LinesController < ApplicationController

  def index
    @lines = Line.all
    @line = Line.new
  end

  def create
    @line = Line.create(params[:line])
    if @line.save
      flash[:notice] = "Bus line created."
      redirect_to('/lines')
    else
      render('/lines')
    end
  end

end
