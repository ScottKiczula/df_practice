class Table < ActiveRecord::Base
  has_many :reservations

  validates :seats, presence: true

  def self.total_tables
    Table.all.count
  end
end