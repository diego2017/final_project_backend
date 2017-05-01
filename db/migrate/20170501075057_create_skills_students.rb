class CreateSkillsStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :skills_students do |t|
      t.integer :skill_id
      t.integer :student_id
    end
  end
end
