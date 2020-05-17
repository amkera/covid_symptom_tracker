class User < ActiveRecord::Base
  has_secure_password
  #authenticate takes a password as a plain string and checks it against bcrypt's
  #hashing algorithm
end
