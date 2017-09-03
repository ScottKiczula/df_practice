class ReservationsController < ApplicationController
  
  def index
    @reservation = Reservation.all
  end

  def new
    @customer = Customer.where(:id => params[:customer_id])
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
      params.require(:reservation).permit(:customer_id, :table_id, :time)
    end
    
end