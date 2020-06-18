FactoryBot.define do
  factory :user do
    username { "testytest" }
    email { "test@example.com" }
    password { 'testing123' }
    password_confirmation { 'testing123' }
  end
end
