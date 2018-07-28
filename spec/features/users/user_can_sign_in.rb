RSpec.describe 'With valid user:' do
    it "can log in" do
      visit '/login'
      fill_in('user_email').with
    end
end
