json.array!(@formroutes) do |formroute|
  json.extract! formroute, :id, :name, :key, :page, :fwd_to_email
  json.url formroute_url(formroute, format: :json)
end
