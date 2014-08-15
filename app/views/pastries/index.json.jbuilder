json.array!(@pastries) do |pastry|
  json.extract! pastry, :id, :name, :type, :price
  json.url pastry_url(pastry, format: :json)
end
