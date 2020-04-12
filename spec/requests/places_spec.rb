require 'rails_helper'

RSpec.describe "/places", type: :request do

  let!(:user) {FactoryBot.create(:user)}
  let!(:user_1) {FactoryBot.create(:user, email: "rahul.kr.das.27@gmail.com")}
  let(:valid_attributes) {
    {name: "Newtown", latitude: 22.5754, longitude: 88.4798, user_id: user.id}
  }

  let(:invalid_attributes) {
    {name: "Newtown", latitude: "qwertyuiop", user_id: "qwerty"}
  }

  describe "GET /index" do
    it "renders new view if no places" do
      sign_in user
      Place.delete_all

      get places_url

      expect(response).to redirect_to(new_place_url)
      follow_redirect!

      expect(response).to render_template(:new)
    end

    it "renders index view if places available" do
      sign_in user
      Place.create! valid_attributes
      get places_url
      expect(response).to render_template(:index)
    end

    it "renders a successful response" do
      sign_in user
      Place.create! valid_attributes
      get places_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders show view" do
      sign_in user
      place = Place.create! valid_attributes
      get place_url(place)
      expect(response).to render_template(:show)
    end

    it "renders a successful response" do
      sign_in user
      place = Place.create! valid_attributes
      get place_url(place)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders new view" do
      sign_in user
      get new_place_url
      expect(response).to render_template(:new)
    end
  end

  describe "GET /edit" do
    it "render to edit page if place creator is the current user" do
      sign_in user
      place = Place.create! valid_attributes
      get edit_place_url(place)
      expect(response).to render_template(:edit)
    end

    it "redirects to show page if place creator isn't the current user" do
      sign_in user_1
      place = Place.create! valid_attributes
      get edit_place_url(place)
      expect(response).to redirect_to(assigns(:place))
      follow_redirect!

      expect(response).to render_template(:show)
    end

    it "render a successful response" do
      sign_in user
      place = Place.create! valid_attributes
      get edit_place_url(place)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Place" do
        sign_in user
        expect {
          post places_url, params: { place: valid_attributes }
        }.to change(Place, :count).by(1)
      end

      it "redirects to the created place" do
        sign_in user
        post places_url, params: { place: valid_attributes }
        expect(response).to redirect_to(place_url(Place.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Place" do
        sign_in user
        expect {
          post places_url, params: { place: invalid_attributes }
        }.to change(Place, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        sign_in user
        post places_url, params: { place: invalid_attributes }
        expect(response).to render_template(:new)
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "Newtown", latitude: 22.9876, longitude: 88.1234, user_id: user.id}
      }

      it "updates the requested place" do
        sign_in user
        place = Place.create! valid_attributes
        patch place_url(place), params: { place: new_attributes }
        place.reload
        expect(place.latitude).to eq(22.9876)
      end

      it "redirects to the place" do
        sign_in user
        place = Place.create! valid_attributes
        patch place_url(place), params: { place: new_attributes }
        place.reload
        expect(response).to redirect_to(place_url(place))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        sign_in user
        place = Place.create! valid_attributes
        patch place_url(place), params: { place: invalid_attributes }
        expect(response).to redirect_to(place_url(place))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested place" do
      sign_in user
      place = Place.create! valid_attributes
      expect {
        delete place_url(place)
      }.to change(Place, :count).by(-1)
    end

    it "redirects to the places list" do
      sign_in user
      place = Place.create! valid_attributes
      delete place_url(place)
      expect(response).to redirect_to(places_url)
    end
  end
end
