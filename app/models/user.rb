class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :shares
  has_many :shared_places, source: :place, through: :shares
  
  has_many :created_places, class_name: "Place"
  
  scope :all_except, ->(user) { where.not(id: user) }

  extend FriendlyId
  friendly_id :name, use: :slugged
end
