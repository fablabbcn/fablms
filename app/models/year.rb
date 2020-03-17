class Year < ApplicationRecord
  belongs_to :organization
  has_many :courses, dependent: :destroy
end
