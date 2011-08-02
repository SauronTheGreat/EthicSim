class StudentGroup < ActiveRecord::Base

  #Relationships
  belongs_to :facilitator_group
  has_many :games, :dependent => :destroy
  has_many :student_group_users, :dependent => :destroy
  has_many :student_group_questionnaires, :dependent => :destroy

	#Validations
  validates_presence_of :facilitator_group_id
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :facilitator_group_id, :message => "should be a integer"
end
