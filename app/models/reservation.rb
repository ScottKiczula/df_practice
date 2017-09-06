class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true

  validate :assign_reservation

  def assign_reservation
    self.table_id = find_table_for_reservation
  end

  def reserved_tables
    unavailable_tables = []
    matching_reservation_times = Reservation.all.where(time: self.time)
    matching_reservation_times.each{|reservation| unavailable_tables << reservation.table_id}
    unavailable_tables
  end

  def available_tables
    all_tables = Table.all
    table_collection = []
    all_tables.each{|table| table_collection << table.id}
    table_collection - reserved_tables
  end

  def find_table_for_reservation
    available_tables.each do |table|
      possible_match = Table.find(table)
      if possible_match.seats >= self.guests
        return possible_match.id
      end
    end
    self.errors.add(:table_id, "There is not enough seats for your party.")
  end
end