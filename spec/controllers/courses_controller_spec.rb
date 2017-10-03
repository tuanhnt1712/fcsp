require "rails_helper"
RSpec.describe CoursesController, type: :controller do
  describe "GET show" do
    let!(:user) {FactoryGirl.create :user}
    let!(:course) {FactoryGirl.create :course}
    it "show success" do
      get :show, params: {user_id: user.id, id: course.id}
      expect(response).to be_present
    end
  end
end
