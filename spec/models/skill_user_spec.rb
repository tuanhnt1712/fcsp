require "rails_helper"

RSpec.describe SkillUser, type: :model do
  describe "Skill User validation" do
    context "association" do
      it{is_expected.to belong_to :user}
      it{is_expected.to belong_to :skill}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:skill_id).of_type :integer}
      it{is_expected.to have_db_column(:user_id).of_type :integer}
    end
  end
end
