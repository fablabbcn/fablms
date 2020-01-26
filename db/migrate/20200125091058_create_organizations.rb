class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :gitlab_url
      t.string :gitlab_token
      t.string :gitlab_folder_id

      t.timestamps
    end
  end
end
