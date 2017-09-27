require "rails_helper"

RSpec.describe JobSkill, type: :model do
  describe "Job Skill validation" do
    context "association" do
      it{is_expected.to belong_to :job}
      it{is_expected.to belong_to :skill}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:skill_id).of_type :integer}
      it{is_expected.to have_db_column(:job_id).of_type :integer}
    end
  end
end
