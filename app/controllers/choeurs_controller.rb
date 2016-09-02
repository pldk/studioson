class ChoeursController < ApplicationController
  before_action :set_choeurs, only: [:show, :edit, :update, :destroy, :create]
  def index
    @choeurs = Choeur.all
    @events_by_datw = @choeurs.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @choeur = Choeur.new
  end

  def create
    @choeur = Choeur.new(choeur_params)

    if @choeur.save
      redirect_to @choeur, notice: "your sessions has been booked."
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

  def set_choeurs
    @choeur = Choeur.find(params[:id])
  end

  def choeur_params
    params.require(:choeur).permit(:name, :start_date, :end_date)
  end
end
