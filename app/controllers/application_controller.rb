class ApplicationController < ActionController::Base

  def index
    @reservation = Reservation.all
  end

end
