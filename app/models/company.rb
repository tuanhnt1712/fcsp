class Company < ApplicationRecord
  acts_as_follower
  acts_as_followable

  after_save :update_user_company

  has_many :jobs, dependent: :destroy
  has_many :candidates, through: :jobs
  has_many :candidate_users, through: :candidates, source: :user
  has_many :addresses, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_many :users, through: :employees
  has_many :groups
  has_one :avatar, class_name: Image.name, foreign_key: :id,
    primary_key: :avatar_id
  has_one :cover_image, class_name: Image.name, foreign_key: :id,
    primary_key: :cover_image_id
  belongs_to :creator, foreign_key: :creator_id, class_name: User.name

  ATTRIBUTES = [:name, :website, :introduction, :founder, :country,
    :company_size, :founder_on, addresses_attributes: [:id, :address,
    :longtitude, :latitude, :head_office],
    images_attributes: [:id, :imageable_id, :imageable_type,
      :picture, :caption]]

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true,
    length: {maximum: Settings.company.max_length_name}
  validates :website, presence: true
  validates :company_size,
    numericality: {greater_than: Settings.company.company_size.greater_than},
    length: {maximum: Settings.company.company_size.max_length}

  private

  def update_user_company
    return unless self.creator_id
    owner = User.find_by id: self.creator_id
    owner.update_attributes company_id: self.id if owner
  end
end
