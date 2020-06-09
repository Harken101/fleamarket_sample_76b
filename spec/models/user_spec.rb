require 'rails_helper'
describe User do
  describe '#create' do

    # step1

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid(:validates_step1)
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?(:validates_step1)
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?(:validates_step1)
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?(:validates_step1)
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?(:validates_step1)
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it " 重複したnicknameが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?(:validates_step1)
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?(:validates_step1)
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid(:validates_step1)
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?(:validates_step1)
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    #step2

    it "family_nameとfirst_name、furigana_family_name、furigana_first_nameとbirthdayが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid(:validates_step2)
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?(:validates_step2)
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?(:validates_step2)
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "furigana_family_nameがない場合は登録できないこと" do
      user = build(:user, furigana_family_name: "")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("を入力してください")
    end

    it "furigana_first_nameがない場合は登録できないこと" do
      user = build(:user, furigana_first_name: "")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("を入力してください")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: "")
      user.valid?(:validates_step2)
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "family_nameが半角数字では場合は登録できないこと" do
      user = build(:user, family_name: "12")
      user.valid?(:validates_step2)
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角数字では場合は登録できないこと" do
      user = build(:user, family_name: "１２")
      user.valid?(:validates_step2)
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが半角英字では場合は登録できないこと" do
      user = build(:user, family_name: "abe")
      user.valid?(:validates_step2)
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角英字では場合は登録できないこと" do
      user = build(:user, family_name: "ABE")
      user.valid?(:validates_step2)
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが半角記号では場合は登録できないこと" do
      user = build(:user, family_name: "-")
      user.valid?(:validates_step2)
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角記号では場合は登録できないこと" do
      user = build(:user, family_name: "〜")
      user.valid?(:validates_step2)
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが全角ひら、カナ、漢字で登録できること" do
      user = build(:user, family_name: "やマ田")
      expect(user).to be_valid(:validates_step2)
    end

    it "first_nameが半角数字では場合は登録できないこと" do
      user = build(:user, first_name: "12")
      user.valid?(:validates_step2)
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角数字では場合は登録できないこと" do
      user = build(:user, first_name: "１２")
      user.valid?(:validates_step2)
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが半角英字では場合は登録できないこと" do
      user = build(:user, first_name: "abe")
      user.valid?(:validates_step2)
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角英字では場合は登録できないこと" do
      user = build(:user, first_name: "ABE")
      user.valid?(:validates_step2)
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが半角記号では場合は登録できないこと" do
      user = build(:user, first_name: "-")
      user.valid?(:validates_step2)
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角記号では場合は登録できないこと" do
      user = build(:user, first_name: "〜")
      user.valid?(:validates_step2)
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが全角ひら、カナ、漢字で登録できること" do
      user = build(:user, first_name: "たカ之")
      expect(user).to be_valid(:validates_step2)
    end

    it "furigana_family_nameが半角数字では場合は登録できないこと" do
      user = build(:user, furigana_family_name: "12")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角数字では場合は登録できないこと" do
      user = build(:user, furigana_family_name: "１２")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが半角英字では場合は登録できないこと" do
      user = build(:user, furigana_family_name: "abe")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角英字では場合は登録できないこと" do
      user = build(:user, furigana_family_name: "ABE")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが半角記号では場合は登録できないこと" do
      user = build(:user, furigana_family_name: "-")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角記号では場合は登録できないこと" do
      user = build(:user, furigana_family_name: "〜")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが漢字では場合は登録できないこと" do
      user = build(:user, furigana_family_name: "山田")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角カタカナでは場合は登録できないこと" do
      user = build(:user, furigana_family_name: "ヤマダ")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが半角カタカナでは場合は登録できないこと" do
      user = build(:user, furigana_family_name: "ﾔﾏﾀﾞ")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_family_name]).to include("は不正な値です")
    end

    it "furigana_family_nameが全角ひらで登録できること" do
      user = build(:user, furigana_family_name: "やまだ")
      expect(user).to be_valid(:validates_step2)
    end

    it "furigana_first_nameが半角数字では場合は登録できないこと" do
      user = build(:user, furigana_first_name: "12")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角数字では場合は登録できないこと" do
      user = build(:user, furigana_first_name: "１２")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが半角英字では場合は登録できないこと" do
      user = build(:user, furigana_first_name: "abe")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角英字では場合は登録できないこと" do
      user = build(:user, furigana_first_name: "ABE")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが半角記号では場合は登録できないこと" do
      user = build(:user, furigana_first_name: "-")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角記号では場合は登録できないこと" do
      user = build(:user, furigana_first_name: "〜")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが漢字では場合は登録できないこと" do
      user = build(:user, furigana_first_name: "孝之")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角カタカナでは場合は登録できないこと" do
      user = build(:user, furigana_first_name: "タカユキ")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが半角カタカナでは場合は登録できないこと" do
      user = build(:user, furigana_first_name: "ﾀｶﾕｷ")
      user.valid?(:validates_step2)
      expect(user.errors[:furigana_first_name]).to include("は不正な値です")
    end

    it "furigana_first_nameが全角ひらで登録できること" do
      user = build(:user, furigana_first_name: "たかゆき")
      expect(user).to be_valid(:validates_step2)
    end
  end
end

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
