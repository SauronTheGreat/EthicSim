class Questionnaire < ActiveRecord::Base

  #Relationships
  has_many :questionnaire_questions, :dependent => :destroy
  has_many :questions, :through => :questionnaire_questions

  #Validations
  validates_presence_of :name
  validates_uniqueness_of :name, :message =>"Sorry ! This name has already been taken"


  validates_presence_of :user_id
  validates_numericality_of :user_id, :message => "User Id should be a integer"
end
