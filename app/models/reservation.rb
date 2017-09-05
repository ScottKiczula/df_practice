class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true

  validate :enough_seats

  def reservation_available
    # Get the time of the reservation
    #reservation_time = self.time
    # Find all other reservations
    #all_reservations = Reservation.all
    # Narrow it down to the same time as the current reservation
    #all_reservations.where(:time == reservation_time)
    # If there are none continue with the reservation
    # Else if there are exclude those table IDs
    # See if there is a table left that can fit the reservation
    # If not return error that there is no room to fit your reservation
  end

  def enough_seats
    table = Table.find(self.table_id)
    if table.seats < self.guests
      self.errors.add(:table_id, "There is not enough seats for your party.")
    else
    end
  end

end