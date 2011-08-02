class CreateQuestionQuestionnaires < ActiveRecord::Migration
  def self.up
    create_table :question_questionnaires do |t|
      t.integer :question_id
      t.integer :questionnaire_id

      t.timestamps
    end
  end

  def self.down
    drop_table :question_questionnaires
  end
end
