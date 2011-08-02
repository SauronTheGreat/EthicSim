class Client < ActiveRecord::Base
has_many :facilitator_groups
  validates_presence_of :name
  validates_presence_of :type_of_client
  validates_uniqueness_of :name
end
