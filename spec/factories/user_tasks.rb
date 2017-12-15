FactoryBot.define do
  factory :user_task do
    user_id user
    course_id course
    subject_id subject
    task_id task
    start_date Time.zone.now
    end_date Time.zone.now
    status "init"
    estimate_time 1
    meta {}
  end
end
