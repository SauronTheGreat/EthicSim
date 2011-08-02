class CreateQuestionnaireSettings < ActiveRecord::Migration
  def self.up
    create_table :questionnaire_settings do |t|
      t.integer :questionnaire_id
      t.integer :category_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :questionnaire_settings
  end
end
