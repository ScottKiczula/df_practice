class ApplicationController < ActionController::Base

  def index
    @reservation = Reservation.all
  end

  protect_from_forgery with: :exception
end
