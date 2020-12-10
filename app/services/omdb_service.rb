require 'omdb/api'

class OmdbService
    def initialize()
        api_key = ENV["OMDB_API_KEY"]

        raise "Missing Omdb api key. Remember to add OMDB_API_KEY to config/application.yml" if api_key.nil?

        @client = Omdb::Api::Client.new(api_key: api_key)
    end

    def find_by_title(params)
        result = @client.find_by_title(params[:title], :type => 'movie')
    end
end