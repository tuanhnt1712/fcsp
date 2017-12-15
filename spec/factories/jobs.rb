FactoryBot.define do
  factory :job do
    title{FFaker::Job.title}
    describe{FFaker::Lorem.sentence}
    who_can_apply :everyone
    type_of_candidate :others
    status :active
    company_id 1
  end
end
