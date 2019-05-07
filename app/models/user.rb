class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes
  validates :username, :password, presence: true
  # check validates for record checks active record
end
