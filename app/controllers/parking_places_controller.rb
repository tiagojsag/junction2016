class ParkingPlacesController < InheritedResources::Base

  private

    def parking_place_params
      params.require(:parking_place).permit(:title, :description, :latitude, :longitude)
    end
end

