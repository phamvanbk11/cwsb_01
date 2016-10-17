require "rails_helper"

RSpec.describe VenuesController, type: :controller do
  before do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET #index" do
    before do
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  context "GET #new" do
    before do
      get :new
    end

    it "renders the index template" do
      expect(response).to render_template(:new)
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  context "GET #edit" do
    let!(:venue) {FactoryGirl.create :venue}
    before do
      get :edit, params: {id: venue.id}
    end

    it "renders the index template" do
      expect(response).to render_template(:edit)
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  context "POST #create" do
    it "responds successfully" do
      post :create, params: {venue: {name: "ABC", description: "dsds"}}
      expect(flash[:success]).not_to be_empty
    end

    it "responds error" do
      process :create, method: :post, params: {venue: { description: "dsds"}}
      expect(response).to render_template(:new)
    end
  end

  context "PATCH #update" do
    let!(:venue) {FactoryGirl.create :venue}
    it "responds successfully" do
      patch :update, params: {id: venue.id, venue: {name: "ABC", description: "dsds"}}
      expect(flash[:success]).not_to be_empty
    end

    it "responds error" do
      process :update, method: :put, params: {id: venue.id, venue: { name: ""}}
      expect(response).to render_template(:edit)
    end
  end
end
