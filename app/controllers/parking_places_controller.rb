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

  # GET /parking_places/1
  # GET /parking_places/1.json
  def show
  end

  # GET /parking_places/new
  def new
    @parking_place = ParkingPlace.new
  end

  # GET /parking_places/1/edit
  def edit
  end

  # POST /parking_places
  # POST /parking_places.json
  def create
    @parking_place = ParkingPlace.new(parking_place_params)

    respond_to do |format|
      if @parking_place.save
        format.html { redirect_to @parking_place, notice: 'Parking place was successfully created.' }
        format.json { render :show, status: :created, location: @parking_place }
      else
        format.html { render :new }
        format.json { render json: @parking_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_places/1
  # PATCH/PUT /parking_places/1.json
  def update
    respond_to do |format|
      if @parking_place.update(parking_place_params)
        format.html { redirect_to @parking_place, notice: 'Parking place was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_place }
      else
        format.html { render :edit }
        format.json { render json: @parking_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_places/1
  # DELETE /parking_places/1.json
  def destroy
    @parking_place.destroy
    respond_to do |format|
      format.html { redirect_to parking_places_url, notice: 'Parking place was successfully destroyed.' }
      format.json { head :no_content }
    end
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
