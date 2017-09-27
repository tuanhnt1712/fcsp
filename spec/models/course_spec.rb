require "rails_helper"

RSpec.describe Course, type: :model do
  context "association" do
    it{is_expected.to have_many :user_courses}
    it{is_expected.to have_many(:users).through :user_courses}
    it{is_expected.to have_many :user_course_subjects}
    it{is_expected.to have_many(:subjects).through :user_course_subjects}
    it{is_expected.to belong_to :programming_language}
  end

  context "enum" do
    it{is_expected.to define_enum_for(:status)}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:programming_language_id).of_type :integer}
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:status).of_type :integer}
    it{is_expected.to have_db_column(:start_date).of_type :datetime}
    it{is_expected.to have_db_column(:end_date).of_type :datetime}
  end
end
