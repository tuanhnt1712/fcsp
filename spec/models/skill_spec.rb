require "rails_helper"

RSpec.describe Skill, type: :model do
  describe "Skill validation" do
    context "association" do
      it{is_expected.to have_many(:users).through :skill_users}
      it{is_expected.to have_many(:jobs).through :job_skills}
      it{is_expected.to have_many(:job_skills).dependent :destroy}
      it{is_expected.to have_many(:skill_users).dependent :destroy}
      it{is_expected.to belong_to :group_skill}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:name).of_type :string}
      it{is_expected.to have_db_column(:description).of_type :text}
    end
  end

  describe "validate attributes" do
    it{is_expected.to validate_presence_of :name}
    it do
      is_expected.to validate_length_of(:name)
        .is_at_most Settings.max_length_title
    end

    it do
      is_expected.to validate_length_of(:description)
        .is_at_most Settings.max_length_description
    end
  end
end
