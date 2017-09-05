RSpec.describe Table, :type => :model do
  subject { Table.new }

  it "is valid with valid attributes" do
    subject.id = "1"
    subject.seats = "2"
    subject.created_at = "2017-09-01 00:00"
    subject.updated_at = "2017-09-01 00:00"

    expect(subject).to be_valid
  end
  it "is not valid without a number of seats" do
    expect(subject).to_not be_valid
  end
end