require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?(:validates_step1)
      expect(user.errors[:nickname]).to include("を入力してください")
    end
  end
end

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
