class Course < ApplicationRecord
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  belongs_to :programming_language
end
