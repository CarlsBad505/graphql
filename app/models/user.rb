class User < ApplicationRecord
  has_secure_password

  has_many :votes
  has_many :links

  validates :name, presence: true, length: { minimum: 1 }
  validates :email, presence: true, uniqueness: true
end
