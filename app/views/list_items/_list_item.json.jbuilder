json.extract! list_item, :id, :list_id, :item_id, :quantity, :created_at, :updated_at
json.url list_item_url(list_item, format: :json)
