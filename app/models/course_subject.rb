class CourseSubject < ApplicationRecord
  has_many :user_course_subjects

  belongs_to :course
  belongs_to :subject


  delegate :name, to: :subject
end
