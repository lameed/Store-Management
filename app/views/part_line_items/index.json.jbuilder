json.array!(@part_line_items) do |part_line_item|
  json.extract! part_line_item, :id, :part_id, :part_request_id
  json.url part_line_item_url(part_line_item, format: :json)
end
