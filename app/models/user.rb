class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes
  validates :username, :password_digest, presence: true
  validates :username, length: { minimum: 4 }
  # check validates for record checks active record(recording 5/7/28:00)
end
