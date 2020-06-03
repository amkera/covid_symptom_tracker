class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :cases
end

#validates is a method ActiveRecord gives you
