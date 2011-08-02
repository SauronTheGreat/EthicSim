class Game < ActiveRecord::Base
 belongs_to :student_group
  has_many :players,:dependent => :destroy

validates_presence_of :student_group_id
validates_numericality_of :student_group_id,:message => "Student group should be a integer"


end
