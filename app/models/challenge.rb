class Challenge < ActiveRecord::Base

  has_many :challenge_activities, dependent: :destroy

  validates :name, :presence => true,
            :length => {:minimum => 5}

  validates_inclusion_of :challenge_type, :in => ChallengeType.keys

  # add some callbacks
  after_initialize :get_datetimes # convert db format to accessors
  before_validation :set_datetimes # convert accessors back to db format

  def get_datetimes
    self.starts_at ||=  DateTime.now.to_date # if the starts_at time is not set, set it to now
  end

  def set_datetimes
    self.starts_at = "#{self.starts_at}" # convert the two fields back to db
  end
end
