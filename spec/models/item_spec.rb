require 'rails_helper'
describe Item do
  describe '#create' do    
    it "nameが空の場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "descriptionが空の場合は登録できないこと" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "nameが40文字以上の場合は登録できない" do
      item = Item.new(name: "a" * 41)
      expect(item.invalid?).to be true
    end

    it "descriptionが1001文字以上の場合は登録できない" do
      item = Item.new(description: "a" * 1001)
      expect(item.invalid?).to be true
    end

    it "priceが10桁以上の場合は登録できない" do
      item = Item.new(price: "1" * 10)
      expect(item.invalid?).to be true
    end

  end
end

RSpec.describe Item, type: :model do
  pending "add so me examples to (or delete) #{__FILE__}"
end
