FactoryGirl.define do

  factory :user do
    email "foo@foo.com"
    password "123456"
    
    factory :admin_user do
      email "johncdavison@gmail.com"
      password "123456"
    end
  end

end
