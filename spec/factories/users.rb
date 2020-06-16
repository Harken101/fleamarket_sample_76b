FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"山田"}
    first_name            {"孝之"}
    furigana_family_name  {"やまだ"}
    furigana_first_name   {"たかゆき"}
    birthday              {"1989-01-20"}
  end

end