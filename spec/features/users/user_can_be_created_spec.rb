RSpec.describe 'On user creation:' do
    it "can be created with valid parameters" do
      visit '/signup'
      fill_in("user_name", with: 'test')
      fill_in("user_email", with: 'test@test.com')
      fill_in("user_password", with: 'password')
      fill_in("user_password_confirmation", with: 'password')
      click_on("Take me to the playground!")

      expect(User.last.name).to eq('test')
      expect(current_path).to eq('/')
    end
    it "can't be created without a name" do
      visit '/signup'
      fill_in("user_name", with: '')
      fill_in("user_email", with: 'test@test.com')
      fill_in("user_password", with: 'password')
      fill_in("user_password_confirmation", with: 'password')
      click_on("Take me to the playground!")

      expect(User.last).to eq(nil)
      expect(current_path).to eq('/signup')
      expect(page).to have_text('Name can\'t be blank')
    end
    it "can't be created without a matching password" do
      visit '/signup'
      fill_in("user_name", with: 'test')
      fill_in("user_email", with: 'test@test.com')
      fill_in("user_password", with: 'password')
      fill_in("user_password_confirmation", with: 'password_confirmation')
      click_on("Take me to the playground!")

      expect(User.last).to eq(nil)
      expect(current_path).to eq('/signup')
      expect(page).to have_text('doesn\'t match')
    end
end
