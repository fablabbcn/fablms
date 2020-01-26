class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :code
      t.string :name
      t.string :username
      t.string :email
      t.boolean :continuing
      t.boolean :is_instructor
      t.string :lab_name
      t.string :lab_handle
      t.string :country
      t.string :continent
      t.string :website_path
      t.references :organization, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
