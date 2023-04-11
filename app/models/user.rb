class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  has_many :statuses
  has_many :followers, foreign_key: :boss_id
  has_many :bosses, through: :followers, source: :subordinate

  has_many :reverse_of_followers, class_name: "Follower", foreign_key: :subordinate_id
  has_many :subordinates, through: :reverse_of_followers, source: :boss
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
end
