json.extract! sale, :id, :customer_id, :item_id, :store_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
