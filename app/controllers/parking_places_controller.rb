class ParkingPlacesController < InheritedResources::Base

  def index
    parking_places = ParkingPlace.paginate(:page => params[:page], :per_page => params[:per_page]).order(params[:order] || 'created_at ASC')
    render json: parking_places
  end

  private

    def parking_place_params
      params.require(:parking_place).permit(:title, :description, :latitude, :longitude)
    end
end

