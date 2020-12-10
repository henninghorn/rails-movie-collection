json.extract! movie, :id, :title, :notes, :omdb_data, :created_at, :updated_at
json.url movie_url(movie, format: :json)
