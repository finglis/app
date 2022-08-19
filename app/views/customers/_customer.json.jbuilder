json.extract! customer, :id, :number, :loyalty, :created_at, :updated_at
json.url customer_url(customer, format: :json)
