class ParkingPlacesController < ApplicationController
  before_action :set_parking_place, only: [:show, :edit, :update, :destroy]

  # GET /parking_places
  # GET /parking_places.json
  def index
    return render status: :bad_request, json: {message: "Missing required param 'latitude'."} if params[:latitude].blank?
    return render status: :bad_request, json: {message: "Missing required param 'longitude'."} if params[:longitude].blank?

    range = params[:range].blank? ? 10000 : params[:range]
    start_time = params[:start_time].blank? ? Time.now : params[:start_time]
    end_time = params[:end_time].blank? ? 1.day.from_now : params[:end_time]

    near = ParkingPlace.near([params[:latitude], params[:longitude]], range, :units => :km)

    time_slots = TimeSlot
                     .includes(:parking_place).references(:parking_place).merge(near)
                     .where('start_time <= ? AND end_time >= ?', start_time, end_time)
                     .paginate(:page => params[:page], :per_page => params[:per_page])

    render json: time_slots, each_serializer: TimeSlotIndexSerializer
  end

  # GET /paring_places/1
  # GET /paring_places/1.json
  def show
  end

  # POST /paring_places
  # POST /paring_places.json
  def create
    @paring_place = ParingPlace.new(paring_place_params)

    if @paring_place.save
      render :show, status: :created, location: @paring_place
    else
      render json: @paring_place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paring_places/1
  # PATCH/PUT /paring_places/1.json
  def update
    if @paring_place.update(paring_place_params)
      render :show, status: :ok, location: @paring_place
    else
      render json: @paring_place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paring_places/1
  # DELETE /paring_places/1.json
  def destroy
    @paring_place.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parking_place
    @parking_place = ParkingPlace.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def parking_place_params
    params.fetch(:parking_place, {})
  end
end
