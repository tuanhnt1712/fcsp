class UserTask < ApplicationRecord
  has_many :comments

  belongs_to :user_course_subject
  belongs_to :task

  enum status: %i(init in_progress finished closed)
end
