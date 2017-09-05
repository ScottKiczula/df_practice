RSpec.describe Table, :type => :model do
  it "is valid with valid attributes" do
    expect(Table.new).to be_valid
  end
  it "is not valid without a number of seats" do
    table = Table.new(seats: nil)
    expect(table).to_not be_valid
  end
end