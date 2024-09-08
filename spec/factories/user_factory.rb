FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "john.doe@example.com" }
    phone { "14996765025" }
    password { "123456" }
    password_confirmation { '123456' }
  end
end