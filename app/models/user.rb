class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :cases
end

#authenticate takes a password as a plain string and checks it against bcrypt's hashing algorithm
#ActiveRecord password validation, ensures it exists
