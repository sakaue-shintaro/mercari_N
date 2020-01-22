FactoryBot.define do
    factory :category do
      association :item
      path              {""}
      name              {"おもちゃ"}
      ancestry          {""}
    end    
  end
