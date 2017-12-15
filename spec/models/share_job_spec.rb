require "rails_helper"

RSpec.describe ShareJob, type: :model do
  describe "Share jobs associations" do
    context "associations" do
      it{is_expected.to belong_to :shareable}
      it{is_expected.to belong_to :user}
    end

    context "columns" do
      it{is_expected.to have_db_column(:user_id).of_type :integer}
      it{is_expected.to have_db_column(:shareable_type).of_type :integer}
      it{is_expected.to have_db_column(:shareable_id).of_type :integer}
      it{is_expected.to have_db_column(:job_id).of_type :integer}
    end

    context "validations" do
      let!(:user){FactoryBot.create :user}
      let!(:job){FactoryBot.create :job}
      let!(:share_job) do
        FactoryBot.create :share_job, user: user, shareable: job
      end
      it{is_expected.to validate_presence_of :shareable_id}
      it{is_expected.to validate_presence_of :user_id}
    end
  end
end
