class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true

  validate :reserved_tables
  validate :enough_seats

  def reservation_available
    reserved_tables
  end

  def reserved_tables
    reservation_time = self.time
    reserved_tables = []
    matching_reservation_times = Reservation.all.where(time: reservation_time)
    matching_reservation_times.each do |reservation|
      reserved_tables << reservation
    end

    if reserved_tables.count >= Table.total_tables
      self.errors.add(:table_id, "There are no tables abvailable at your reservation time.")
    else
      p reserved_tables
      reserved_tables
    end
  end

  def avilable_tables
    all_tables = Tables.all
  availiable_tables = all_tables
  # reserved_table_ids = []
  #   reserved_tables.each do |table|
  # end
  end

  def enough_seats
    table = Table.find(self.table_id)
    if table.seats < self.guests
      self.errors.add(:table_id, "There is not enough seats for your party.")
    else
    end
  end
    # Else if there are exclude those table IDs
    # See if there is a table left that can fit the reservation
    # If not return error that there is no room to fit your reservation
end