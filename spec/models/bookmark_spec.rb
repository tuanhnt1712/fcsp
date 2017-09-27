require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "Bookmark validation" do
    context "association" do
      it{is_expected.to belong_to :user}
      it{is_expected.to belong_to :job}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:user_id).of_type :integer}
      it{is_expected.to have_db_column(:job_id).of_type :integer}
    end
  end
end
