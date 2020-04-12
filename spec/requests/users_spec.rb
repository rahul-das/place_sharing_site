require 'rails_helper'

RSpec.describe "/users", type: :request do

  let!(:user_1) {FactoryBot.create(:user, email: "rahul.kr.das.27@gmail.com")}
  let(:valid_attributes) {
    {name: 'janelle santiago', email: 'janelle+santiago@becker.com', password: 'poiuytrewq', password_confirmation: 'poiuytrewq'}
  }

  let(:invalid_attributes) {
    {name: 'janelle santiago', email: 'poiuytrewq', password: 'poiuytrewq', password_confirmation: 'poiuytrewq'}
  }

  describe "GET /index" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      sign_in user
      get users_url
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      sign_in user
      get user_url(user)
      expect(response).to be_redirect
    end

    it "redirects to /places if showing current_user" do
      user = User.create! valid_attributes
      sign_in user
      get user_url(user)
      expect(response).to redirect_to(places_url)
    end

    it "redirects to /users if showing other users" do
      user = User.create! valid_attributes
      sign_in user
      get user_url(user_1)
      expect(response).to redirect_to(users_url)
    end
  end
end
