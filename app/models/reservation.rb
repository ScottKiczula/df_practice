class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true

  validate :reserved_tables
  validate :reservation_available
  # validate :enough_seats

  def reservation_available
    if reserved_tables.count >= Table.total_tables
      self.errors.add(:table_id, "There are no tables abvailable at your reservation time.")
    else
      available_tables
    end
  end

  def reserved_tables
    reservation_time = self.time
    reserved_tables = []
    matching_reservation_times = Reservation.all.where(time: reservation_time)
    matching_reservation_times.each do |reservation|
      reserved_tables << reservation.table_id
    end
    reserved_tables
    # if reserved_tables.count >= Table.total_tables
    #   self.errors.add(:table_id, "There are no tables abvailable at your reservation time.")
    # else
    #   reserved_tables
    # end
  end

  def available_tables
    all_tables = Table.all
    table_collection = []
    all_tables.each do |table|
      table_collection << table.id
    end
    availiable_reservations = table_collection - reserved_tables
  end

  def enough_seats
    puts "your available reservations are #{availiable_reservations}"
    table = Table.find(self.table_id)
    if table.seats < self.guests
      self.errors.add(:table_id, "There is not enough seats for your party.")
    end
  end
    # Else if there are exclude those table IDs
    # See if there is a table left that can fit the reservation
    # If not return error that there is no room to fit your reservation
end