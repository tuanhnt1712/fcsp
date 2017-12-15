FactoryBot.define do
  factory :course do
    programming_language_id programming_language
    name "[KN] [OpenEducation] Ruby on Rails"
    start_date Time.zone.now
    end_date Time.zone.now + 2.months
    status "in_progress"
  end
end
