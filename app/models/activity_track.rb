class ActivityTrack < ActiveRecord::Base
  belongs_to :activity

  validates :activity, presence: true
  validates :amount, presence: true
  validates :tracked_on, presence: true
end
