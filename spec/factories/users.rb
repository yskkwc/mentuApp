FactoryBot.define do
  factory :user do
    username { "bob" }
    email    { "bob@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
  end

  factory :sampleuser do
    sequence(:username) { |n| "sampleuser #{n}" }
    sequence(:email)    { |n| "#{n}sample@example.com" }
    password            { "dottle-nouveau-pavilion-tights-furze" }
  end
end
