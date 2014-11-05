class ChallengeActivity < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :activity

  validates_inclusion_of :threshold_kind, :in => ThresholdKind.keys
end
