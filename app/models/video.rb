class Video < ApplicationRecord
  has_many :orders
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true }
  validates :difficulty, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :video_url, presence: true
  validates :video_type, presence: true

  monetize :price_cents

  validate :check_if_user_is_instructor

  def check_if_user_is_instructor
    unless user.instructor?
      errors.add(:user, "cannot create")
    end
  end
end
