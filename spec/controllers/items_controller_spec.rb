require 'rails_helper'

describe ItemsController do
  describe 'GET #check' do
    it "renders the :check template" do
      user = build(:user)
      category = build(:category)
      item = build(:item)
      image = build(:image)
      get :check, params: { id: item }
      expect(response).to render_template :check
    end
    it "assigns the requested item to @item" do
      user = build(:user)
      category = build(:category)
      item = build(:item)
      get :check, params: { id: item }
      expect(assigns(:item)).to eq item
    end
  end
end