FactoryBot.define do
  factory :user_task do
    user_course_subject_id user_course_subject
    task_id task
  end
end
