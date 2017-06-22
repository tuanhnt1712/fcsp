class JobSkill < ApplicationRecord
  belongs_to :job
  belongs_to :skill

  scope :of_job, ->job{includes(:skill).where job: job}
end
