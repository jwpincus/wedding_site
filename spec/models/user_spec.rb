require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with valid attributes" do
      expect(User.new(
        name: 'test',
        email: 'test@test.com',
        password: 'test',
        password_confirmation: 'test'
        )).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { should validate_uniqueness_of(:email) }

end
