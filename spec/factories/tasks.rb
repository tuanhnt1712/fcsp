FactoryBot.define do
  factory :task do
    subject_id subject
    name "Ruby book in 2 days"
    description "Ruby language"
    task_type 1
  end
end
