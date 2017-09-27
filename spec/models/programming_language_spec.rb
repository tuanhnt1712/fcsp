require "rails_helper"

RSpec.describe ProgrammingLanguage, type: :model do
  context "association" do
    it{is_expected.to have_many :courses}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:description).of_type :string}
  end
end
