json.extract! dish, :id, :name, :ingredients_id, :quantity, :note, :created_at, :updated_at
json.url dish_url(dish, format: :json)
