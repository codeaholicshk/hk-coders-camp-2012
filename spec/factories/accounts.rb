FactoryGirl.define do
  factory :admin, class: Account do
    name "Admin"
    sequence(:email) {|n| "admin#{n}@codeaholics.hk" }
    password "secret"
    password_confirmation "secret"
    role :admin
  end
  
  factory :publisher, class: Account do
    name "Steith Joms"
    sequence(:email) {|n| "s#{n}@codeaholics.hk" }
    password "secret"
    password_confirmation "secret"
    role :user
  end

  # This will use the User class (Admin would have been guessed)
  factory :coder, class: Account do
    name "Chinese Otaku"
    sequence(:email) {|n| "c#{n}@codeaholics.hk" }
    password "secret"
    password_confirmation "secret"
    role :user
  end
end