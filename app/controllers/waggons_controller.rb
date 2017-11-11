class WaggonsController < ApplicationController
  before_action :set_waggon, only: [:show, :edit, :update, :destroy]

  def index
    @waggons = Waggon.all
  end

  def show
  end

  def new
    @waggon = Waggon.new
  end

  def create
    @waggon = Waggon.new(waggon_params)

    if @waggon.save
      redirect_to @waggon
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @waggon.update(waggon_params)
      redirect_to @waggon
    else
      render :edit
    end

    def destroy
      @waggon.destroy
      redirect_to waggons_path
    end

  end

  private

  def set_waggon
    @waggon = Waggon.find(params[:id])
  end

  def waggon_params
    params.require(:waggon).permit(:waggon_type, :upper_shelf, :lower_shelf, :train_id)
  end
end