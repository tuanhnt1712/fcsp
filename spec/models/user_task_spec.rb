require "rails_helper"

RSpec.describe UserTask, type: :model do
  describe "UserTask validation" do
    context "association" do
      it{is_expected.to belong_to :task}
      it{is_expected.to belong_to :user}
      it{is_expected.to belong_to :course}
      it{is_expected.to belong_to :subject}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:user_id).of_type :integer}
      it{is_expected.to have_db_column(:course_id).of_type :integer}
      it{is_expected.to have_db_column(:subject_id).of_type :integer}
      it{is_expected.to have_db_column(:task_id).of_type :integer}
      it{is_expected.to have_db_column(:start_date).of_type :datetime}
      it{is_expected.to have_db_column(:end_date).of_type :datetime}
      it{is_expected.to have_db_column(:status).of_type :integer}
      it{is_expected.to have_db_column(:estimate_time).of_type :float}
      it{is_expected.to have_db_column(:meta).of_type :text}
    end
  end

  describe "serialize" do
    it{is_expected.to serialize(:meta).as(Hash)}
  end

  describe "enumable" do
    it do
      is_expected.to define_enum_for(:status)
        .with %i(init in_progress finished closed)
    end
  end

  describe "delegate" do
    it "name" do
      is_expected.to delegate_method(:name).to(:task).with_prefix true
    end

    it "task_type" do
      is_expected.to delegate_method(:task_type).to(:task).with_prefix true
    end

    it "description" do
      is_expected.to delegate_method(:description).to(:task).with_prefix true
    end
  end

  describe "testing scope" do
    let!(:user){FactoryBot.create :user}
    let!(:course){FactoryBot.create :course}
    let!(:subject){FactoryBot.create :subject}
    let!(:task){FactoryBot.create :task}

    let!(:user_task) do
      FactoryBot.create :user_task, user_id: user.id,
        course_id: course.id, subject_id: subject.id, task_id: task.id
    end

    context "when course_id and subject_id is valid" do
      it do
        expect(UserTask.check_course_subject course.id, subject.id)
          .to include user_task
      end
    end

    context "when course_id is empty" do
      it do
        expect(UserTask.check_course_subject nil, subject.id).to be_empty
      end
    end

    context "when subject_id is empty" do
      it do
        expect(UserTask.check_course_subject course.id, nil).to be_empty
      end
    end
  end
end
