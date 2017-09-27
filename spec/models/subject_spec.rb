require "rails_helper"

RSpec.describe Subject, type: :model do
  context "association" do
    it{is_expected.to have_many :user_course_subjects}
    it{is_expected.to have_many(:courses).through :user_course_subjects}
    it{is_expected.to have_many :tasks}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:description).of_type :string}
  end
end
