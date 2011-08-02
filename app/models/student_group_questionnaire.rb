class StudentGroupQuestionnaire < ActiveRecord::Base
 belongs_to :questionnaire
  belongs_to :student_group
  validates_presence_of :questionnaire_id
  validates_presence_of :student_group_id
  validates_numericality_of :questionnaire_id,:message => "should be a integer"
  validates_numericality_of :student_group_id,:message => "should be a integer"
end
