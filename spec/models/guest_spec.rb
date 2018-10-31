require 'rails_helper'

RSpec.describe Guest, type: :model do
  it "is valid with valid attributes" do
    expect(Guest.new(
      name: 'jack pincus',
      email: 'test@test.com',
      )).to be_valid
  end
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it "can have a plus_one" do
    guest = create :guest_with_plus_one
    expect(guest.plus_ones.count).to eq(1)
  end
  
end
