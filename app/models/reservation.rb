class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :guests, presence: true
  validates :table_id, presence: true
  validates :time, presence: true
end