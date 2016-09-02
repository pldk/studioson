class StudiosController < ApplicationController
  def index
    @studios = Studio.all
    @events_by_date = @studios.group_by(&:date)     
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    if @studio.save
      redirect_to @studio, notice: "Your session has been booked."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_studio 
    @studio = studio.find(params[:id])
  end

  def studio_params
    params.require(:stduio).permit(:name, :start_date, :end_date)
  end
end
