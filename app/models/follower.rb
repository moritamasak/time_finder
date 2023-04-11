class Follower < ApplicationRecord
  belongs_to :boss_id, class_name: "User"
  belongs_to :subordinate_id, class_name: "User"
end
