require "rails_helper"

RSpec.describe User, type: :model do
  describe "User validation" do
    context "association" do
      it{is_expected.to have_many(:user_groups).dependent :destroy}
      it{is_expected.to have_many(:employer_groups).through :user_groups}
      it{is_expected.to have_many(:candidates).dependent :destroy}
      it{is_expected.to have_many(:images).dependent :destroy}
      it{is_expected.to have_many(:jobs).through :candidates}
      it{is_expected.to have_many(:created_jobs).dependent :destroy}
      it{is_expected.to have_many(:bookmarked_jobs).through :bookmarks}
      it{is_expected.to have_many :skill_users}
      it{is_expected.to have_many(:skills).through :skill_users}
      it{is_expected.to have_many(:user_schools).dependent :destroy}
      it{is_expected.to have_many(:schools).through :user_schools}
      it{is_expected.to have_many(:shares).dependent :destroy}
      it{is_expected.to have_many :share_jobs}
      it{is_expected.to have_many(:user_languages).dependent :destroy}
      it{is_expected.to have_many(:languages).through :user_languages}
      it{is_expected.to have_many(:companies)}
      it{is_expected.to have_many(:share_posts).dependent :destroy}
      it{is_expected.to have_many :user_course_subjects}
      it{is_expected.to have_many :user_courses}
      it{is_expected.to have_many(:courses).through :user_courses}
      it{is_expected.to have_many(:online_contacts).dependent :destroy}
      it{is_expected.to have_many(:share_posts).dependent :destroy}
      it{is_expected.to have_one :avatar}
      it{is_expected.to have_one :cover_image}
      it{is_expected.to have_many :bookmarks}
      it{is_expected.to have_one(:info_user).dependent :destroy}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:name).of_type :string}
      it{is_expected.to have_db_column(:email).of_type :string}
      it{is_expected.to have_db_column(:avatar).of_type :string}
      it{is_expected.to have_db_column(:phone).of_type :string}
      it{is_expected.to have_db_column(:role).of_type :integer}
      it{is_expected.to have_db_column(:status).of_type :string}
      it{is_expected.to have_db_column(:occupation).of_type :string}
      it{is_expected.to have_db_column(:country).of_type :string}
      it{is_expected.to have_db_column(:relationship_status).of_type :string}
      it{is_expected.to have_db_column(:birthday).of_type :datetime}
      it{is_expected.to have_db_column(:gender).of_type :integer}
      it{is_expected.to have_db_column(:address).of_type :string}
      it{is_expected.to have_db_column(:provider).of_type :string}
    end
  end

  describe "validations" do
    it{is_expected.to validate_presence_of :name}
    it do
      is_expected.to validate_length_of(:name)
        .is_at_most Settings.company.max_length_name
    end
    it{is_expected.to validate_presence_of :email}
  end

  describe "get newest user" do
    let!(:user1){FactoryGirl.create :user, created_at: Time.now}
    let!(:user2) do
      FactoryGirl.create :user, created_at: Time.now + 1.hour
    end
    let!(:user3) do
      FactoryGirl.create :user, created_at: Time.now + 2.hours
    end
    users = User.newest
    it "returns ordered list" do
      expect(users).to eq [user3, user2, user1]
    end
  end
end
