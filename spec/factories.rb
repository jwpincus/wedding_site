FactoryBot.define do
  factory :plus_one do
    name "Jan Jones"
    email "jan@mail.com"
    guest
  end
  factory :guest do
    name "bob Jones"
    email "bob@mail.com"
    factory :guest_with_plus_one do
      transient do
        plus_one_count { 1 }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |guest, evaluator|
        create_list(:plus_one, evaluator.plus_one_count, guest: guest)
      end
    end
  end
  
  factory :user do
    
    name "test"
    email "test@email.com"
    password "password"
  end
end
