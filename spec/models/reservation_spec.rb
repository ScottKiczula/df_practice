require 'rails_helper'

RSpec.describe Reservation, :type => :model do
  subject { Reservation.new }
  table = {Table.new}

  it "is valid with valid attributes" do
    subject.id = "1"
    subject.name = "Adam"
    subject.guests = "1"
    subject.created_at = "2017-09-01 00:00"
    subject.updated_at = "2017-09-01 00:00"
    subject.time = "2017-09-01 00:00"
    subject.table_id = "1"
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    resetvation = Reservation.new(name: nil)
    expect(subject).to_not be_valid
  end
end