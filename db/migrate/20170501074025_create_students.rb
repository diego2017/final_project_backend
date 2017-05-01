class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.string :email
      t.string :linkedin_id
      t.string :linkedin_url
      t.string :facebook_url
      t.string :github_url
      t.string :website_url
      t.string :img_url

      t.timestamps
    end
  end
end
