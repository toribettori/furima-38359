FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_full { Gimei.last.kanji }
    first_name_full { Gimei.first.kanji }
    family_name_harf { Gimei.last.katakana }
    first_name_harf { Gimei.first.katakana }
    birth_day { "1983-03-03"}
  end
end