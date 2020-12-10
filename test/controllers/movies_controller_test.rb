require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
    setup do
        @movie = movies(:one)
        @movie_invalid = movies(:two)
    end
    
    test "should get index" do
        get movies_url
        assert_response :success
    end
    
    test "should get new" do
        get new_movie_url
        assert_response :success
    end
    
    test "should create movie and get Omdb data if title is valid" do
        assert_difference('Movie.count') do
            post movies_url, params: { movie: { notes: @movie.notes, title: @movie.title } }
        end
        
        assert_equal('Christopher Nolan', Movie.last.omdb('director'))
        
        assert_redirected_to movie_url(Movie.last)
    end
    
    test "should not create movie if title is invalid" do
        assert_no_difference('Movie.count') do
            post movies_url, params: { movie: { notes: @movie_invalid.notes, title: @movie_invalid.title } }
        end

        assert_response :unprocessable_entity
    end
    
    test "should show movie" do
        get movie_url(@movie)
        assert_response :success
    end
    
    test "should get edit" do
        get edit_movie_url(@movie)
        assert_response :success
    end
    
    test "should update movie" do
        patch movie_url(@movie), params: { movie: { notes: @movie.notes, title: @movie.title } }
        assert_redirected_to movie_url(@movie)
    end
    
    test "should destroy movie" do
        assert_difference('Movie.count', -1) do
            delete movie_url(@movie)
        end
        
        assert_redirected_to movies_url
    end
end
