require "rails_helper"

RSpec.describe JobTeam, type: :model do
  describe "Job team validation" do
    context "association" do
      it{is_expected.to belong_to :job}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:job_id).of_type :integer}
    end
  end
end
