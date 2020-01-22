require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "is invalid without a cateogry_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without brandname" do
      item = build(:item, brandname: "")
      item.valid?
      expect(item.errors[:brandname]).to include("can't be blank")
    end

    it "is invalid without price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without saler_id" do
      item = build(:item, saler_id: "")
      item.valid?
      expect(item.errors[:saler_id]).to include("can't be blank")
    end

    it "is invalid without buyer_id" do
      item = build(:item, buyer_id: "")
      item.valid?
      expect(item.errors[:buyer_id]).to include("can't be blank")
    end

  end
end