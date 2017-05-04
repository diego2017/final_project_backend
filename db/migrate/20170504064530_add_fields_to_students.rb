class AddFieldsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :cohort, :string
    add_column :students, :skills, :text
    add_column :students, :interests, :text
  end
end
