json.extract! user_list, :id, :user_id, :list_id, :created_at, :updated_at
json.url user_list_url(user_list, format: :json)
