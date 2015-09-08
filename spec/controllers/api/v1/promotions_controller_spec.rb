require 'spec_helper'

describe Api::V1::PromotionsController do

  describe "GET #show" do
    before(:each) do
      @promotion = FactoryGirl.create :promotion
      get :show, id: @promotion.id
    end

    it "returns the information about a reporter on a hash" do
      promotion_response = json_response
      expect(promotion_response[:promotion][:product_name]).to eql @promotion.product_name
    end

    it { should respond_with 200 }
  end

  describe "GET #index" do
    before(:each) do
      4.times { FactoryGirl.create :promotion }
      get :index
    end

    it "returns 4 records from the database" do
      promotions_response = json_response
      expect(promotions_response[:promotions]).to have(4).items
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        @promotion_attributes = FactoryGirl.attributes_for :promotion
        api_authorization_header user.auth_token
        post :create, { user_id: user.id, promotion: @promotion_attributes }
      end

      it "renders the json representation for the promotion record just created" do
        promotion_response = json_response
        expect(promotion_response[:promotion][:product_name]).to eql @promotion_attributes[:product_name]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        user = FactoryGirl.create :user
        @invalid_promotion_attributes = { product_name: "Smart TV", price: "Twelve dollars" } #notice I'm not including the email
        api_authorization_header user.auth_token
        post :create, { user_id: user.id, promotion: @invalid_promotion_attributes }
      end

      it "renders an errors json" do
        promotion_response = json_response
        expect(promotion_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        promotion_response = json_response
        expect(promotion_response[:errors][:price]).to include "is not a number"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
      @promotion = FactoryGirl.create :promotion, user: @user
      api_authorization_header @user.auth_token
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { user_id: @user.id, id: @promotion.id, promotion: { product_name: "An expensive TV" } }
      end

      it "renders the json representation for the updated user" do
        promotion_response = json_response
        expect(promotion_response[:promotion][:product_name]).to eql "An expensive TV"
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, { user_id: @user.id, id: @promotion.id, promotion: { price: "two hundred" } }
      end

      it "renders an errors json" do
        promotion_response = json_response
        expect(promotion_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        promotion_response = json_response
        expect(promotion_response[:errors][:price]).to include "is not a number"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      @promotion = FactoryGirl.create :promotion, user: @user
      api_authorization_header @user.auth_token
      delete :destroy, { user_id: @user.id, id: @promotion.id }
    end

    it { should respond_with 204 }
  end

end
