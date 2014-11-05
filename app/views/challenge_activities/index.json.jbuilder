json.array!(@challenge_activities) do |challenge_activity|
  json.extract! challenge_activity, :challenge_id, :activity_id, :threshold_value, :threshold_kind, :number_thresholds, :points_per_threshold
  json.url challenge_activity_url(challenge_activity, format: :json)
end
