class ShareProfile < ApplicationRecord
  belongs_to :user_share, class_name: User.name
  belongs_to :user_shared, class_name: User.name

  validates :user_share_id, presence: true
  validates :user_shared_id, presence: true

  scope :find_shared, (lambda do |id|
    where user_shared_id: id
  end)
end
