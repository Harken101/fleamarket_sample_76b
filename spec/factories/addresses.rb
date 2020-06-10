FactoryBot.define do
  factory :address do
    family_name           {"山田"}
    first_name            {"孝之"}
    furigana_family_name  {"やまだ"}
    furigana_first_name   {"たかゆき"}
    zipcode               {"123-4456"}
    presence              {"1"}
    city                  {"渋谷区"}
    street                {"恵比寿1-10-1"}
    tell                  {"0123456789"}
  end
end