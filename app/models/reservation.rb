class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true

  validate :assign_reservation
  # validate :reserved_tables
  # validate :reservation_available
  # validate :enough_seats

  def assign_reservation
    self.table_id = enough_seats
  end

  def reservation_available
    if reserved_tables.count >= Table.total_tables
      self.errors.add(:table_id, "There are no tables abvailable at your reservation time.")
    else
      enough_seats
    end
  end

  def reserved_tables
    reservation_time = self.time
    unavailable_tables = []
    matching_reservation_times = Reservation.all.where(time: reservation_time)
    matching_reservation_times.each{|reservation| unavailable_tables << reservation.table_id}
    unavailable_tables
  end

  def available_tables
    all_tables = Table.all_tables
    table_collection = []
    all_tables.each{|table| table_collection << table.id}
    table_collection - reserved_tables
  end

  def enough_seats
    available_tables.each do |table|
      possible_match = Table.find(table)
      if possible_match.seats >= self.guests
        return possible_match.id
      end
    end
    self.errors.add(:table_id, "There is not enough seats for your party.")
  end
end