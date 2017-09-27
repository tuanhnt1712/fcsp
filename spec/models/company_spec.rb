require "rails_helper"

RSpec.describe Company, type: :model do
  describe "Company associations" do
    context "columns" do
      it{is_expected.to have_db_column(:name).of_type :string}
      it{is_expected.to have_db_column(:website).of_type :string}
      it{is_expected.to have_db_column(:introduction).of_type :text}
      it{is_expected.to have_db_column(:founder).of_type :string}
      it{is_expected.to have_db_column(:country).of_type :string}
      it{is_expected.to have_db_column(:company_size).of_type :integer}
      it{is_expected.to have_db_column(:founder_on).of_type :date}
    end

    context "associations" do
      it{is_expected.to have_many :jobs}
      it{is_expected.to have_many :addresses}
      it{is_expected.to have_many(:candidates).through :jobs}
      it{is_expected.to have_many(:employees).dependent :destroy}
      it{is_expected.to have_many(:images).dependent :destroy}
      it{is_expected.to have_many(:users).through :employees}
      it{is_expected.to have_many :groups}
      it{is_expected.to have_one :cover_image}
      it{is_expected.to belong_to :creator}
    end
  end

  describe "validations" do
    it{is_expected.to validate_presence_of :name}
    it do
      expect validate_length_of(:name)
        .is_at_most Settings.company.max_length_name
    end
    it{is_expected.to validate_presence_of :website}
    it{is_expected.to validate_numericality_of(:company_size).is_greater_than 0}
  end
end
