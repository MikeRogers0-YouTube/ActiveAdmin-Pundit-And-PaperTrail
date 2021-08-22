FactoryBot.define do
  factory :user do
    password { User.new.send(:password_digest, "12345678") }
    encrypted_password { User.new.send(:password_digest, "12345678") }

    sequence :email do |n|
      "test#{n}@example.com"
    end
  end
end
