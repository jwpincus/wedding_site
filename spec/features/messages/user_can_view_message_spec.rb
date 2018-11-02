RSpec.describe 'Admin can' do
  let(:message) { FactoryBot.create(:message) }
  let(:user) { FactoryBot.create(:user) }
  
  it "View a created message" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/admin/messages/' + message.id.to_s
    expect(page.html).to include(message.body)
    expect(page).to have_content(message.subject)
  end
  
  it "view a table of all messages on the dashboard" do
    message
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/dashboard'
    expect(page).to have_content(message.subject)
  end
end