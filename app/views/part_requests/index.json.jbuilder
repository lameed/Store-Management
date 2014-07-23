json.array!(@part_requests) do |part_request|
  json.extract! part_request, :id
  json.url part_request_url(part_request, format: :json)
end
