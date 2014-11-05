json.array!(@activity_tracks) do |activity_track|
  json.extract! activity_track, :tracked_on, :amount
  json.url activity_track_url(activity_track, format: :json)
end
