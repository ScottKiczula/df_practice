class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true

  # validate :reserved_tables
  # validate :reservation_available
  # validate :enough_seats
  validate :assign_reservation

  def assign_reservation
    # p available_tables
    p enough_seats
    # available_tables = available_tables - enough_seats
    self.table_id = enough_seats
    # puts "#{self.table_id}"
  end

  def reservation_available
    if reserved_tables.count >= Table.total_tables
      self.errors.add(:table_id, "There are no tables abvailable at your reservation time.")
    else
      available_tables
    end
    # enough_seats
  end

  def reserved_tables
    reservation_time = self.time
    reserved_tables = []
    matching_reservation_times = Reservation.all.where(time: reservation_time)
    matching_reservation_times.each do |reservation|
      reserved_tables << reservation.table_id
    end
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
    # puts "your available tables are #{available_tables}"
    available_tables.each do |table|
      possible_match = Table.find(table)
      if possible_match.seats >= self.guests
        return possible_match.id
      end
    end
    self.errors.add(:table_id, "There is not enough seats for your party.")
  end
end