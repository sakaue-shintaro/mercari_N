require 'rails_helper'

describe User do
  describe '#create' do
    #email
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #nickname
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    #password
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 姓
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    
    # 名
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 姓カナ
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    
    # 名カナ
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 電話番号関連
    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    # 郵便番号関連
    it "is invalid without a address_number" do
      user = build(:user, address_number: nil)
      user.valid?
      expect(user.errors[:address_number]).to include("can't be blank")
    end

    # 都道府県
    it "is invalid without a address_prefecture" do
      user = build(:user, address_prefecture: nil)
      user.valid?
      expect(user.errors[:address_prefecture]).to include("can't be blank")
    end
    
    # 市区町村
    it "is invalid without a address_name" do
      user = build(:user, address_name: nil)
      user.valid?
      expect(user.errors[:address_name]).to include("can't be blank")
    end


  end
end
