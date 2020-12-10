require 'test_helper'

class MovieTest < ActiveSupport::TestCase
    test 'require title' do
        movie = Movie.new(title: '')
        refute movie.valid?
    end

    test 'require title that matches omdb' do
        movie = Movie.new(title: 'SUPER_DUPER_INVALID_NAME')

        refute movie.valid?

        assert_not_nil movie.errors[:title]
    end

    test 'a valid model fetches omdb data to model' do
        movie = Movie.new(title: 'Interstellar')

        assert movie.valid?

        movie.save

        assert_not_nil(movie.omdb_data)
        assert_equal('Christopher Nolan', movie.omdb('director'))
    end

    test 'request to invalid omdb data results in empty string' do
        movie = Movie.new(title: 'Interstellar')

        movie.save
        
        assert_nil(movie.omdb('invalid_attribute'))
    end
end
