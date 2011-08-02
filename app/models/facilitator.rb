class Facilitator < ActiveRecord::Base
 has_one :user
  has_one :facilitator_group
  has_many :questionnaires,:dependent => :destroy

  validates_uniqueness_of :user_id
end
