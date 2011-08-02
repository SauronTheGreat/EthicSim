class CreateStudentGroupQuestionnaires < ActiveRecord::Migration
  def self.up
    create_table :student_group_questionnaires do |t|
      t.integer :student_group_id
      t.integer :questionnaire_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_group_questionnaires
  end
end
