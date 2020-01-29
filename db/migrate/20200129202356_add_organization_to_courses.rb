class AddOrganizationToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :organization, foreign_key: true
  end
end
