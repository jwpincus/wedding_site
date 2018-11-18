require 'rails_helper'

RSpec.describe Guest, type: :model do
  it "is valid with valid attributes" do
    expect(Guest.new(
      first_name: 'jack',
      last_name: 'pincus',
      email: 'test@test.com',
      )).to be_valid
  end
  it { should validate_presence_of(:first_name) }
  # it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:messages) }


end
