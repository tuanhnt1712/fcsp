require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let!(:user) {FactoryGirl.create :user}
  before :each do
    sign_in user
    WebMock.allow_net_connect!
  end

  describe "GET #show" do
    context "load blocked user" do
      let!(:user) {FactoryGirl.create :user}
      it do
        get :show, params: {id: user}
        expect(response).to have_http_status :success
      end
    end

    context "load user success" do

      it "user found" do
        get :show, params: {id: user}
        expect(response).to render_template :show
      end

      it "responds successfully with an HTTP 200 status code" do
        get :show, params: {id: user}, xhr: true
        expect(response).to have_http_status 200
      end

      it "responds successfully with show bookmarked jobs" do
        job = FactoryGirl.create :job
        FactoryGirl.create :bookmark, user: user, job: job
        get :show, params: {id: user, bookmarked_jobs_page: 2}, xhr: true
        expect(response).to render_template partial: "_job_accordance"
      end
    end
  end

  describe "PATCH #update" do
    it "update successfully" do
      patch :update, params: {id: user, auto_synchronize: true}
      expect(controller).to set_flash[:success]
        .to(I18n.t "users.update.auto_synchronize_success")
    end

    it "update error" do
      patch :update, params: {id: user}
      expect(controller).to set_flash[:error]
        .to(I18n.t "users.update.auto_synchronize_error")
    end
  end
end
