class Course < ApplicationRecord
  belongs_to :year
  belongs_to :organization
  has_many :students, dependent: :destroy
  has_many :labs, dependent: :destroy
end
