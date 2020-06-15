require 'rails_helper'
describe Item do
  describe '#create' do
    
    it "nameが空では登録できないこと" do
      item = build(:item, name:"")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "descriptionが空では登録できないこと" do
      item = build(:item, description:"")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "imagesが空では登録できないこと" do
      item = build(:item, images:"")
      item.valid?
      expect(item.errors[:images]).to include("を選んでください")
    end

    it "priceが空では登録できないこと" do
      item = build(:item, price:"")
      item.valid?
      expect(item.errors[:price]).to include("を選んでください")
    end

    it "payerが空では登録できないこと" do
      item = build(:item, payer:"")
      item.valid?
      expect(item.errors[:payer]).to include("を選んでください")
    end
  
    it "user_idが空では登録できないこと" do
      item = build(:item, user_id:"")
      item.valid?
      expect(item.errors[:user_id]).to include("を選んでください")
    end

    it "nameが40文字以上であれば登録できないこと" do
      item = build(name:"a" * 41)
      item.valid?
      expect(item).to be_invalid
    end

  end
end
