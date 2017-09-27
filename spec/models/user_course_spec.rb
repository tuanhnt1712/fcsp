require "rails_helper"

RSpec.describe UserCourse, type: :model do
  context "association" do
    it{is_expected.to belong_to :user}
    it{is_expected.to belong_to :course}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:user_id).of_type :integer}
    it{is_expected.to have_db_column(:course_id).of_type :integer}
  end
end
