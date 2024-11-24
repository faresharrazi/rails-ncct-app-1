json.extract! transaction, :id, :title, :amount, :category, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
