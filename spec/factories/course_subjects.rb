FactoryGirl.define do
  factory :course_subject do
    course_id course
    subject_id subject
    start_date Time.zone.now
    end_date Time.zone.now + 10.days
  end
end
