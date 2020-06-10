require 'rails_helper'
describe Address do
  describe '#create' do

    it "family_nameとfirst_name、furigana_family_name、furigana_first_name,zipcode、prefecture、cityとstreet
    が存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid(:validates_step3)
    end

    it "family_nameがない場合は登録できないこと" do
      address = build(:address, family_name: "")
      address.valid?(:validates_step3)
      expect(address.errors[:family_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      address = build(:address, first_name: "")
      address.valid?(:validates_step3)
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "furigana_family_nameがない場合は登録できないこと" do
      address = build(:address, furigana_family_name: "")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("を入力してください")
    end

    it "furigana_first_nameがない場合は登録できないこと" do
      address = build(:address, furigana_first_name: "")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("を入力してください")
    end

    it "zipcodeがない場合は登録できないこと" do
      address = build(:address, furigana_first_name: "")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: "")
      address.valid?(:validates_step3)
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?(:validates_step3)
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "streetがない場合は登録できないこと" do
      address = build(:address, street: "")
      address.valid?(:validates_step3)
      expect(address.errors[:street]).to include("を入力してください")
    end


    it "family_nameが半角数字では場合は登録できないこと" do
      address = build(:address, family_name: "12")
      address.valid?(:validates_step3)
      expect(address.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角数字では場合は登録できないこと" do
      address = build(:address, family_name: "１２")
      address.valid?(:validates_step3)
      expect(address.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが半角英字では場合は登録できないこと" do
      address = build(:address, family_name: "abe")
      address.valid?(:validates_step3)
      expect(address.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角英字では場合は登録できないこと" do
      address = build(:address, family_name: "ABE")
      address.valid?(:validates_step3)
      expect(address.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが半角記号では場合は登録できないこと" do
      address = build(:address, family_name: "-")
      address.valid?(:validates_step3)
      expect(address.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角記号では場合は登録できないこと" do
      address = build(:address, family_name: "〜")
      address.valid?(:validates_step3)
      expect(address.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角ひら、カナ、漢字で登録できること" do
      address = build(:address, family_name: "やマ田")
      expect(address).to be_valid(:validates_step3)
    end

    it "first_nameが半角数字では場合は登録できないこと" do
      address = build(:address, first_name: "12")
      address.valid?(:validates_step3)
      expect(address.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角数字では場合は登録できないこと" do
      address = build(:address, first_name: "１２")
      address.valid?(:validates_step3)
      expect(address.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが半角英字では場合は登録できないこと" do
      address = build(:address, first_name: "abe")
      address.valid?(:validates_step3)
      expect(address.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角英字では場合は登録できないこと" do
      address = build(:address, first_name: "ABE")
      address.valid?(:validates_step3)
      expect(address.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが半角記号では場合は登録できないこと" do
      address = build(:address, first_name: "-")
      address.valid?(:validates_step3)
      expect(address.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角記号では場合は登録できないこと" do
      address = build(:address, first_name: "〜")
      address.valid?(:validates_step3)
      expect(address.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角ひら、カナ、漢字で登録できること" do
      address = build(:address, first_name: "たカ之")
      expect(address).to be_valid(:validates_step3)
    end

    it "furigana_family_nameが半角数字では場合は登録できないこと" do
      address = build(:address, furigana_family_name: "12")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角数字では場合は登録できないこと" do
      address = build(:address, furigana_family_name: "１２")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが半角英字では場合は登録できないこと" do
      address = build(:address, furigana_family_name: "abe")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角英字では場合は登録できないこと" do
      address = build(:address, furigana_family_name: "ABE")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが半角記号では場合は登録できないこと" do
      address = build(:address, furigana_family_name: "-")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角記号では場合は登録できないこと" do
      address = build(:address, furigana_family_name: "〜")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが漢字では場合は登録できないこと" do
      address = build(:address, furigana_family_name: "山田")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角カタカナでは場合は登録できないこと" do
      address = build(:address, furigana_family_name: "ヤマダ")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが半角カタカナでは場合は登録できないこと" do
      address = build(:address, furigana_family_name: "ﾔﾏﾀﾞ")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角ひらで登録できること" do
      address = build(:address, furigana_family_name: "やまだ")
      expect(address).to be_valid(:validates_step3)
    end

    it "furigana_first_nameが半角数字では場合は登録できないこと" do
      address = build(:address, furigana_first_name: "12")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角数字では場合は登録できないこと" do
      address = build(:address, furigana_first_name: "１２")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが半角英字では場合は登録できないこと" do
      address = build(:address, furigana_first_name: "abe")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角英字では場合は登録できないこと" do
      address = build(:address, furigana_first_name: "ABE")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが半角記号では場合は登録できないこと" do
      address = build(:address, furigana_first_name: "-")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角記号では場合は登録できないこと" do
      address = build(:address, furigana_first_name: "〜")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが漢字では場合は登録できないこと" do
      address = build(:address, furigana_first_name: "孝之")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角カタカナでは場合は登録できないこと" do
      address = build(:address, furigana_first_name: "タカユキ")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが半角カタカナでは場合は登録できないこと" do
      address = build(:address, furigana_first_name: "ﾀｶﾕｷ")
      address.valid?(:validates_step3)
      expect(address.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角ひらで登録できること" do
      address = build(:address, furigana_first_name: "たかゆき")
      expect(address).to be_valid(:validates_step3)
    end

    it "zipcodeがカタカナでは場合は登録できないこと" do
      address = build(:address, zipcode: "カタカナ-カタカ")
      address.valid?(:validates_step3)
      expect(address.errors[:zipcode]).to include("は不正な値です")
    end

    it "zipcodeがひらがなでは場合は登録できないこと" do
      address = build(:address, zipcode: "ひらがな-ひらが")
      address.valid?(:validates_step3)
      expect(address.errors[:zipcode]).to include("は不正な値です")
    end

    it "zipcodeが漢字では場合は登録できないこと" do
      address = build(:address, zipcode: "漢字")
      address.valid?(:validates_step3)
      expect(address.errors[:zipcode]).to include("は不正な値です")
    end

    it "zipcodeが全角数字では場合は登録できないこと" do
      address = build(:address, zipcode: "１２３−４４０１")
      address.valid?(:validates_step3)
      expect(address.errors[:zipcode]).to include("は不正な値です")
    end

    it "zipcodeが半角数字8桁では場合は登録できないこと" do
      address = build(:address, zipcode: "123-45678")
      address.valid?(:validates_step3)
      expect(address.errors[:zipcode]).to include("は不正な値です")
    end

    it "zipcodeが全角数字では場合は登録できないこと" do
      address = build(:address, zipcode: "１２３−４４０１")
      address.valid?(:validates_step3)
      expect(address.errors[:zipcode]).to include("は不正な値です")
    end

    it "zipcodeが”-”ない場合は登録できないこと" do
      address = build(:address, zipcode: "1234567")
      address.valid?(:validates_step3)
      expect(address.errors[:zipcode]).to include("は不正な値です")
    end

    it "zipcodeが3桁-4桁は登録できること" do
      address = build(:address, zipcode: "123-4567")
      expect(address).to be_valid(:validates_step3)
    end

    it "zipcodeが3桁は(旧住所)登録できること" do
      address = build(:address, zipcode: "123")
      expect(address).to be_valid(:validates_step3)
    end

    it "zipcodeが3桁2桁=5桁（旧住所）は登録できること" do
      address = build(:address, zipcode: "123-45")
      expect(address).to be_valid(:validates_step3)
    end

    it "tellが全角数字では場合は登録できないこと" do
      address = build(:address, tell: "１２")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが半角英字では場合は登録できないこと" do
      address = build(:address, tell: "abe")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが全角英字では場合は登録できないこと" do
      address = build(:address, tell: "ABE")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが半角記号では場合は登録できないこと" do
      address = build(:address, tell: "-")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが全角記号では場合は登録できないこと" do
      address = build(:address, tell: "〜")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが漢字では場合は登録できないこと" do
      address = build(:address, tell: "山田")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが全角カタカナでは場合は登録できないこと" do
      address = build(:address, tell: "ヤマダ")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが半角カタカナでは場合は登録できないこと" do
      address = build(:address, tell: "ﾔﾏﾀﾞ")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが半角数字9桁以下では場合は登録できないこと" do
      address = build(:address, tell: "123456789")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが半角数字12桁以上では場合は登録できないこと" do
      address = build(:address, tell: "012345678901")
      address.valid?(:validates_step3)
      expect(address.errors[:tell]).to include("は不正な値です")
    end

    it "tellが半角数字10桁で登録できること" do
      address = build(:address, tell: "0123456789")
      expect(address).to be_valid(:validates_step3)
    end

    it "tellが半角11桁数字で登録できること" do
      address = build(:address, tell: "01234567890")
      expect(address).to be_valid(:validates_step3)
    end

    it "prefectureがid=47(沖縄県)で登録できること" do
      address = build(:address, prefecture: "47")
      expect(address).to be_valid(:validates_step3)
    end

    it "prefectureがid=48(なし)で登録できない" do
      address = build(:address, prefecture: "49")
      address.valid?(:validates_step3)
      expect(address.errors[:prefecture]).to include("は47以下の値にしてください")
    end
  end
end

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
