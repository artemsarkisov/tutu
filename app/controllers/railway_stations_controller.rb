class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: %i[show edit update destroy update_position update_arrival_date
                                               update_departure_date]
  before_action :set_route, only: %i[update_position update_arrival_date update_departure_date]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully created.' }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully updated.' }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  def update_arrival_date
    @railway_station.update_time(@route, :arrival_date, params[:arrival_date])
  end

  def update_departure_date
    @railway_station.update_time(@route, :departure_date, params[:departure_date])
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def set_route
    @route = Route.find_by(params[:route_id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title, :position, :arrival_date, :departure_date)
  end
end
