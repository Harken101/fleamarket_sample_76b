FactoryBot.define do

  factory :item do
    name            {"商品名"}
    description     {"商品説明"}
    status          {"1"}
    price           {"1000"}
    payer           {"1"}
    preday          {"1"}
    sold            {"1"}
    user_id         {"1"}
    postage_type_id {"1"}
    category_id     {"1"}
    prefecture_id   {"1"}
  end

end