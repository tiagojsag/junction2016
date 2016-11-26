class ParkingPlacesController < InheritedResources::Base
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

  private

  def parking_place_params
    params.require(:parking_place).permit(:title, :description, :latitude, :longitude)
  end
end

