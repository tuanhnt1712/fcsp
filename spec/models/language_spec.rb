require "rails_helper"

RSpec.describe Language, type: :model do
  context "association" do
    it{is_expected.to have_many :user_languages}
    it{is_expected.to have_many :users}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:name).of_type :string}
  end

  context "validation" do
    it{is_expected.to validate_presence_of :name}
    it do
      is_expected.to validate_length_of(:name)
        .is_at_most Settings.language.name_max_length
    end
  end
end
