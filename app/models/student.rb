class Student < ApplicationRecord
  belongs_to :organization
  belongs_to :course, optional: true

  validates :username, uniqueness: { scope: :organization, message: 'username taken' }

  def self.import_csv(file, organization, course)
    CSV.foreach(file.path, headers: true, col_sep: ';') do |row|
      row_hash = row.to_hash
      row_hash['organization'] = organization
      row_hash['course'] = Course.find(course)

      Student.create row_hash
    end
  end
end
