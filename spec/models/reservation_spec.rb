require 'rails_helper'

RSpec.describe Reservation, :type => :model do
  it "is valid with valid attributes" do
    expect(Reservation.new).to be_valid
  end
  it "is not valid without a name" do
    resetvation = Reservation.new(name: nil)
    expect(reservation).to_not be_valid
  end
end