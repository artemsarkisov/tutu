class WaggonsController < ApplicationController
  before_action :set_waggon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @waggons = Waggon.all
  end

  def show
    @waggon = Waggon.find(params[:id])
  end

  def new
    @waggon = Waggon.new
  end

  def create
    @waggon = @train.waggons.new(waggon_params)

    if @waggon.save
      redirect_to @train
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @waggon.update(waggon_params)
      redirect_to waggon_path(@waggon)
    else
      render :edit
    end
  end

  def destroy
    @waggon.destroy
    redirect_to waggons_path
  end

  private

  def set_train
    @train  = Train.find_by(params[:train_id])
  end

  def set_waggon
    @waggon = Waggon.find(params[:id])
  end

  def waggon_params
    params.require(:waggon).permit(:type, :upper_shelf, :lower_shelf, :side_upper_shelf, :side_lower_shelf, :train_id,
                                   :seat, :number)
  end
end

