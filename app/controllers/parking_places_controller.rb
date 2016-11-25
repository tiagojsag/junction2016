class ParkingPlacesController < InheritedResources::Base

  def index
    return render status: :bad_request, json: {message: "Missing required param 'latitude'."} if params[:latitude].blank?
    return render status: :bad_request, json: {message: "Missing required param 'longitude'."} if params[:longitude].blank?
    range = params[:range].blank? ? 10000 : params[:range]

    parking_places = ParkingPlace
                         .near([params[:latitude], params[:longitude]], range, :units => :km)
                         .paginate(:page => params[:page], :per_page => params[:per_page])
    render json: parking_places
  end

  private

  def parking_place_params
    params.require(:parking_place).permit(:title, :description, :latitude, :longitude)
  end
end

