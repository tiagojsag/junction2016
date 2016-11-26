class TimeSlotsController < InheritedResources::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
    time_slots = TimeSlot.paginate(:page => params[:page], :per_page => params[:per_page])
    render json: time_slots
  end


  private

    def time_slot_params
      params.require(:time_slot).permit(:start, :end, :price)
    end
end

