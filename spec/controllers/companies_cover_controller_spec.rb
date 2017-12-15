require "rails_helper"

RSpec.describe CompaniesCoverController, type: :controller do
  let!(:company) {FactoryBot.create :company}
  let!(:image) do
    Rack::Test::UploadedFile
      .new(Rails.root.join("spec", "support", "education", "image", "test.jpg"))
  end
  let!(:image_fail) do
    Rack::Test::UploadedFile
      .new(Rails.root.join("spec", "support", "education", "image", "fail_test.txt"))
  end

  describe "POST #create" do
    it "change cover successfully" do
      post :create, params: {id: company.id, picture: image}
      expect(controller).to set_flash[:success]
        .to(I18n.t "companies.cover.success")
    end

    it "change cover fail" do
      post :create, params: {id: company.id, picture: image_fail}
      expect(controller).to set_flash[:danger]
        .to(I18n.t "companies.cover.danger")
    end
  end

  describe "PATCH #update" do
    it "update cover successfully" do
      cover = Image.create imageable: company, picture: image
      patch :update, params: {id: company.id, image_id: cover.id}
      expect(controller).to set_flash[:success]
        .to(I18n.t "companies.cover.success")
    end
  end
end
