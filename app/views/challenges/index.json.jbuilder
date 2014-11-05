json.array!(@challenges) do |challenge|
  json.extract! challenge, :name, :description, :startsAt, :endsAt
  json.url challenge_url(challenge, format: :json)
end
