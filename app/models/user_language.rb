class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language

  delegate :name, to: :language, prefix: true
  enum level: %i(Native Professional Conversational)
end
