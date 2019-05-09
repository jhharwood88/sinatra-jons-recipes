class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :name, :ingredients, :procedures, presence: true
end
