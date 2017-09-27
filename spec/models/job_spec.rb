require "rails_helper"

RSpec.describe Job, type: :model do
  describe "Job validation" do
    context "association" do
      it{is_expected.to belong_to :company}
      it{is_expected.to have_many :images}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:title).of_type :string}
      it{is_expected.to have_db_column(:describe).of_type :string}
      it{is_expected.to have_db_column(:type_of_candidate).of_type :integer}
      it{is_expected.to have_db_column(:candidates_count).of_type :integer}
      it{is_expected.to have_db_column(:who_can_apply).of_type :integer}
      it{is_expected.to have_db_column(:company_id).of_type :integer}
      it{is_expected.to have_db_column(:status).of_type :integer}
      it{is_expected.to have_db_column(:profile_requests).of_type :string}
    end
  end

  describe "validate attributes" do
    it do
      is_expected.to validate_length_of(:title)
        .is_at_most Settings.max_length_title
    end
    it{is_expected.to validate_presence_of :describe}
    it{is_expected.to validate_presence_of :type_of_candidate}
    it{is_expected.to validate_presence_of :who_can_apply}
  end
end
