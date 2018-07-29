RSpec.describe 'Post can:' do
  before :each do
    @user = create(:user)
  end

  it "be created by logged in user" do
    visit '/login'
    fill_in('email', with: @user.email)
    fill_in('password', with: @user.password)
    click_on('Log In')
    visit '/posts/new'
    fill_in 'post_title', with: "Test title"
    fill_in 'post_text', with: "Test text"
    click_on 'save'
    expect('page')

  end
end
