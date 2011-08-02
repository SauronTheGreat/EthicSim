class PlayerAnswer < ActiveRecord::Base
validates_presence_of :player_id
  validates_presence_of :question_id
  validates_presence_of :answer
  validates_presence_of :answer_after_self_scoring
end

