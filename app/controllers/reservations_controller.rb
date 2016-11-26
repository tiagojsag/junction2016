class ReservationsController < InheritedResources::Base

  private

    def reservation_params
      params.require(:reservation).permit(:start, :end, :price)
    end
end

