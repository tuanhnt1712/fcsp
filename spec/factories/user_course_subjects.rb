FactoryBot.define do
  factory :user_course_subject do
    user_id user
    course_id course
    subject_id subject
    start_date Time.zone.now + 1.months
    end_date Time.zone.now + 1.months
    status %i(init in_progress finished closed).sample
    content FFaker::Lorem
  end
end
