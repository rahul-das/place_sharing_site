class Place < ApplicationRecord
  belongs_to :user

  validates :user, :name, :latitude, :longitude, presence: true
  
  has_many :shares
  has_many :shared_users, source: :user, through: :shares
  
  scope :shared_public, -> { where(is_public: true) }
  scope :shared_with, ->(user) { joins(:shares).where(shares: {user_id: user}) }
  scope :not_cteated_by, ->(user) { where.not(user_id: user) }
end
