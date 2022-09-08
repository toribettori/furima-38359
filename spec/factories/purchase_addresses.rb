FactoryBot.define do
  factory :purchase_address do
      post_code { '123-4567' }
      area_id { "3" }
      municipality { '横浜市緑区' }
      house_number { '青山1-1' }
      building { '東京ハイツ' }
      phone { '09012345678' }
  end
end
