class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:show, :update, :destroy]

  # GET /time_slots
  # GET /time_slots.json
  def index
    @time_slots = TimeSlot.all
  end

  # GET /time_slots/1
  # GET /time_slots/1.json
  def show
  end

  # POST /time_slots
  # POST /time_slots.json
  def create
    @time_slot = TimeSlot.new(time_slot_params)

    if @time_slot.save
      render :show, status: :created, location: @time_slot
    else
      render json: @time_slot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_slots/1
  # PATCH/PUT /time_slots/1.json
  def update
    if @time_slot.update(time_slot_params)
      render :show, status: :ok, location: @time_slot
    else
      render json: @time_slot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_slots/1
  # DELETE /time_slots/1.json
  def destroy
    @time_slot.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def time_slot_params
    params.fetch(:time_slot, {})
  end
end
