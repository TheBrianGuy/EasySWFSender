json.array!(@formroutes) do |formroute|
  json.extract! formroute, :id, :name, :key, :page
  json.url formroute_url(formroute, format: :json)
end
