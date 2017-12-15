require "rails_helper"

RSpec.describe UserCourseSubject, type: :model do
  context "association" do
    it{is_expected.to belong_to :user}
    it{is_expected.to belong_to :subject}
    it{is_expected.to belong_to :course}
  end

  context "enum" do
    it do
      is_expected.to define_enum_for(:status)
        .with %i(init in_progress finished closed)
    end
  end

  context "delegate" do
    it{is_expected.to delegate_method(:name).to(:subject).with_prefix}
    it{is_expected.to delegate_method(:description).to(:subject).with_prefix}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:user_id).of_type :integer}
    it{is_expected.to have_db_column(:course_id).of_type :integer}
    it{is_expected.to have_db_column(:subject_id).of_type :integer}
    it{is_expected.to have_db_column(:start_date).of_type :datetime}
    it{is_expected.to have_db_column(:end_date).of_type :datetime}
    it{is_expected.to have_db_column(:status).of_type :integer}
    it{is_expected.to have_db_column(:content).of_type :string}
  end

  context "test scope check_user " do
    let!(:user){FactoryBot.create :user}
    let!(:user2){FactoryBot.create :user}
    let!(:course){FactoryBot.create :course}
    let!(:subject){FactoryBot.create :subject}
    let!(:user_course_subject) do
      FactoryBot.create :user_course_subject, user_id: user.id,
        course_id: course.id, subject_id: subject.id
    end

    it "matching successfully" do
      expect(UserCourseSubject.check_user user)
        .to include user_course_subject
    end

    it "matching not successfully" do
      expect(UserCourseSubject.check_user user2)
        .not_to include user_course_subject
    end
  end
end
