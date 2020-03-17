class CreateLabs < ActiveRecord::Migration[6.0]
  def change
    create_table :labs do |t|
      t.string :name
      t.string :slug
      t.belongs_to :course, null: false, foreign_key: true
      t.string :country
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
