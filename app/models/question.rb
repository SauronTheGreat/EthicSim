class Question < ActiveRecord::Base

  #Relationships
  has_many :options, :dependent => :destroy
  has_many :questionnaire_questions

  belongs_to :type
  belongs_to :category

 #Validations
  validates_presence_of :statement
  validates_presence_of :type_id
  #validates_presence_of :category_id
  #validates_presence_of :answer
  #validates_uniqueness_of :statement


end
