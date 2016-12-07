json.extract! request, :id, :from_id, :to_id, :created_at, :updated_at
json.url request_url(request, format: :json)
