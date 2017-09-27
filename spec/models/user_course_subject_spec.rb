require "rails_helper"

RSpec.describe UserCourseSubject, type: :model do
  context "association" do
    it{is_expected.to belong_to :user}
    it{is_expected.to belong_to :subject}
    it{is_expected.to belong_to :course}
  end

  context "enum" do
    it{is_expected.to define_enum_for(:status)}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:user_id).of_type :integer}
    it{is_expected.to have_db_column(:course_id).of_type :integer}
    it{is_expected.to have_db_column(:subject_id).of_type :integer}
    it{is_expected.to have_db_column(:start_date).of_type :datetime}
    it{is_expected.to have_db_column(:end_date).of_type :datetime}
    it{is_expected.to have_db_column(:status).of_type :integer}
  end
end
