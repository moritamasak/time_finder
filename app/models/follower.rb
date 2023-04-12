class Follower < ApplicationRecord
  belongs_to :boss, class_name: "User"
  belongs_to :subordinate, class_name: "User"
end
