class User < ActiveRecord::Base
  #authenticate takes a password as a plain string and checks it against bcrypt's hashing algorithm
  has_secure_password
  #ActiveRecord password validation, ensures it exists
  has_many :cases
end
