json.array!(@activities) do |activity|
  json.extract! activity, :name, :description, :limit
  json.url activity_url(activity, format: :json)
end
