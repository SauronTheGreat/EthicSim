class CreateQuestionnaireQuestions < ActiveRecord::Migration
  def self.up
    create_table :questionnaire_questions do |t|
      t.integer :question_id
      t.integer :questionnaire_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questionnaire_questions
  end
end
