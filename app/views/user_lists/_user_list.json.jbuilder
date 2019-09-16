json.extract! user_list, :id, :name, :notes, :created_at, :updated_at
json.url user_list_url(user_list, format: :json)
