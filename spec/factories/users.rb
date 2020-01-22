FactoryBot.define do
    factory :user do
      association :item
      nickname                {"daissh06"}
      email                   {"buy10@test.com"}
      last_name               {"山田"}
      first_name              {"太郎"}
      last_name_kana          {"ヤマダ"}
      first_name_kana         {"タロウ"}
      birthdate_year          {"2012"}
      birthdate_month         {"1"}
      birthdate_day           {"1"}
      phone_number            {"2222"}
      address_number          {"123-4567"}
      address_prefecture      {"0"}
      address_name            {"名古屋市"}
      address_block           {"10"}
      address_building        {""}
      address_phone_number    {""}
      introduce               {""}
      encrypted_password      {"hoge1233"}
      reset_password_token    {"hoge1233"}
      reset_password_sent_at  {""}
      remember_created_at     {""}
    end   
  end