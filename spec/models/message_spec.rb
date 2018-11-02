require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is valid with valid attributes" do
    expect(Message.new(
      body: 'jack pincus',
      subject: 'test@test.com',
      )).to be_valid
  end
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:subject) }
  it { should have_many(:guests) }

end
