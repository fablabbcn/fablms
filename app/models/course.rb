class Course < ApplicationRecord
  belongs_to :year
  belongs_to :organization
  has_many :students
end
