class Course < ApplicationRecord
  belongs_to :year
  has_many :students
end
