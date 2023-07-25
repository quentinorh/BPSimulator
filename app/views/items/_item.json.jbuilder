json.extract! item, :id, :name, :weight, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)
