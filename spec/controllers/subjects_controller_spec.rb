require "rails_helper"

RSpec.describe SubjectsController, type: :controller do
  describe "GET show" do
    let!(:user) {FactoryBot.create :user}
    let!(:course) {FactoryBot.create :course}
    let!(:subject) {FactoryBot.create :subject}
    it "show success" do
      get :show, params: {user_id: user.id, course_id: course.id, id: subject.id}
      expect(response).to be_present
    end
  end
end
