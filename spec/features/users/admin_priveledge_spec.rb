RSpec.describe 'Admin can' do
  let(:user) { FactoryBot.create(:user) }
    it "access dashboard" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'
      
      expect(current_path).to eq('/dashboard')
    end
    
    it "not access dashboard if not logged in" do
      visit '/dashboard'
      
      expect(current_path).to eq('/')
    end
    
    
end