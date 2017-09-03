class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to root_path
    else
      render root_path
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:name, :guests, :table_id, :time)
    end
    
end