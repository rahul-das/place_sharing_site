 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/users", type: :request do
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
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
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      sign_in user
      get user_url(user)
      expect(response).to be_redirect
    end
  end
end
