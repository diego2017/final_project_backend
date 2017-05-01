class CreateInterestsStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :interests_students do |t|
      t.integer :interest_id
      t.integer :student_id
    end
  end
end
