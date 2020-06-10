require 'rails_helper'

it "family_nameとfirst_name、furigana_family_name、furigana_first_name,zipcode、prefecture、cityとstreet
が存在すれば登録できること" do
  user = build(:user)
  expect(user).to be_valid(:validates_step1)
end

it "nicknameがない場合は登録できないこと" do
  user = build(:user, nickname: "")
  user.valid?(:validates_step1)
  expect(user.errors[:nickname]).to include("を入力してください")
end

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
