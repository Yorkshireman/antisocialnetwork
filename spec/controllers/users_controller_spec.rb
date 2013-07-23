require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      pending
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      pending
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      response.should render_template 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => 1
      response.should render_template 'show'
      response.should be_success
    end
  end

  describe "creating a customer'" do
    it "should add customer id to database" do
      user = FactoryGirl.create(:user)
       Stripe::Customer.should_receive(:create).and_return(double(:id => '12345'))
       put :update, :id => user.id, :stripe_card_token => "tok_u5dg20Gra"
       user.reload
       expect(user.stripe_customer_id).to eq('12345')
    end
  end

  describe "PUT 'update'" do
    it "returns http success" do
      put 'update', :id => 1
      response.should redirect_to 'show'
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      delete 'destroy', :id => 1
      response.should redirect_to 'index'
    end
  end

end
