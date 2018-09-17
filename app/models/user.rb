class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :groups, through: :group_users
  has_many :group_users
  
  validates :name, :email, presence: true, uniqueness: true
end
