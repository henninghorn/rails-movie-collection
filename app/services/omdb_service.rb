require 'omdb/api'

class OmdbService
    def initialize()
        api_key = ENV["OMDB_API_KEY"]
        @client = Omdb::Api::Client.new(api_key: api_key)
    end

    def find_by_title(params)
        result = @client.find_by_title(params[:title], :type => 'movie')
    end
end