RSpec.describe 'Admin can' do
  let(:user) { FactoryBot.create(:user) }

  it "Upload CSV of guests" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/admin/guests/new'
    expect(current_path).to eq('/admin/guests/new')
    attach_file("Upload Your Guest List", Rails.root + "spec/fixtures/guests.csv")
    click_on 'Submit'
    expect(current_path).to eq('/dashboard')
    expect(Guest.last.name).to eq('Cayley Coulbourn')
    expect(Guest.first.plus_ones.count).to eq(1)
    expect(page).to have_content('Jack Pincus')
    binding.pry
  end
end
