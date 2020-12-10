class AddOmdbDataToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :omdb_data, :json
  end
end
