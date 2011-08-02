class QuestionnaireQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :questionnaire
end
