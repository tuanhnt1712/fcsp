require "rails_helper"

RSpec.describe Task, type: :model do
  context "association" do
    it{is_expected.to have_many :user_tasks}
    it{is_expected.to belong_to :subject}
  end

  context "enum" do
    it{is_expected.to define_enum_for :task_type}
  end

  context "column_specifications" do
    it{is_expected.to have_db_column(:subject_id).of_type :integer}
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:description).of_type :string}
    it{is_expected.to have_db_column(:task_type).of_type :integer}
  end
end
