class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.reservation_available

    if @reservation.save
      p @reservation
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:name, :guests, :table_id, :time)
    end
    
end