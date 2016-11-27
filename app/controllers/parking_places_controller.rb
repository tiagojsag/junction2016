class ParkingPlacesController < ApplicationController
  before_action :set_parking_place, only: [:show, :update, :destroy]

  # GET /parking_places
  # GET /parking_places.json
  def index
    @parking_places = ParkingPlace.all
  end

  # GET /parking_places/1
  # GET /parking_places/1.json
  def show
  end

  # POST /parking_places
  # POST /parking_places.json
  def create
    @parking_place = ParkingPlace.new(parking_place_params)

    if @parking_place.save
      render :show, status: :created, location: @parking_place
    else
      render json: @parking_place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parking_places/1
  # PATCH/PUT /parking_places/1.json
  def update
    if @parking_place.update(parking_place_params)
      render :show, status: :ok, location: @parking_place
    else
      render json: @parking_place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parking_places/1
  # DELETE /parking_places/1.json
  def destroy
    @parking_place.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parking_place
    @parking_place = ParkingPlace.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def parking_place_params
    params.permit(:title, :description, :latitude, :longitude)
  end
end
