require "rails_helper"
require "companies_controller"

RSpec.describe CompaniesController, type: :controller do
  describe "GET #show/:id" do
    it "responds successfully with an HTTP 200 status code" do
      company = FactoryBot.create :company
      get :show, params: {id: company.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "company created" do
    let!(:company) {FactoryBot.create :company}
    it "company created success" do
      post :create, company: {name: company.name,
        website: company.website, company_size: company.company_size}
      expect(response).to have_http_status :success
    end

    it "company created error" do
      post :create, company: {name: company.name}
      expect(response).to have_http_status :error
    end
  end
end
