require 'rails_helper'

RSpec.describe PlusOne, type: :model do
  it "is valid with valid attributes" do
    expect(Guest.new(
      name: 'jack pincus',
      email: 'test@test.com',
      )).to be_valid
  end
  it { should validate_presence_of(:name) }
  
end
