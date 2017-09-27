require "rails_helper"

RSpec.describe Address, type: :model do
  describe "Address validation" do
    context "association" do
      it{is_expected.to belong_to :company}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:address).of_type :string}
      it{is_expected.to have_db_column(:longitude).of_type :float}
      it{is_expected.to have_db_column(:latitude).of_type :float}
      it{is_expected.to have_db_column(:head_office).of_type :boolean}
    end
  end
end
