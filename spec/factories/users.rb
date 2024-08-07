# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "test@example.com" }
    password { "Password1" }
    cpf { "12345678901" }
  end
end
