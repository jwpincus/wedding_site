FactoryBot.define do

  factory :message do
    body "<div>Body</div><div><strong>BOdy bold</strong></div><h1><strong>Body Large Bold</strong></h1><div><br></div><ul><li>Bullets</li></ul>"
    subject "Test Subject"
  end

  factory :guest do
    first_name "bob"
    last_name 'jones'
    email "bob@mail.com"

  end

  factory :user do
    is_admin true
    name "test"
    email "test@email.com"
    password "password"


  end
end
