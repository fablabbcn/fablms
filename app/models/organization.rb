class Organization < ApplicationRecord
  has_many :years
  has_many :students
  has_many :courses
  has_many :user_organizations
  has_many :users, through: :user_organizations
end
