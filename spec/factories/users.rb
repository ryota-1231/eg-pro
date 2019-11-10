FactoryBot.define do
  factory :user do
    name {'test_user'}
    email { 'test1@example.com' }
    password { 'password' }
  end
end
