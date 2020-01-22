FactoryBot.define do

  factory :item do
      name                {"ユニクロジャケット"}
      status              {"0"}
      body                {"良品です"}
      category_id         {"1"}
      size                {"M"}
      brandname           {"ナイキ"} 
      condition           {"美品"}
      burden              {"出品者負担"}
      region              {"愛知"}
      sending_days        {"2-3日で発送"}
      price               {"5000"}
      saler_id            {"1"}
      buyer_id            {"1"}
  end    
  end