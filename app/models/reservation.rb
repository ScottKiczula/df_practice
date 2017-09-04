class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true

  def find_table
    # Find the reservation time
    reservation_time = @reservation.time
    all_reservations = Reservation.all
    all_reservations.each do |reservation|
      if reservation.time == reservation_time
        reservation. >> available_tables = []
      else
      end
    end
    # Find all the tables
    all_tables = Tables.all
    # See which tables have reservations at that time and remove them
    # Out of the available tables see which have enough seats
    # Seat the reservation at the smallest table that will fit it
  end
end