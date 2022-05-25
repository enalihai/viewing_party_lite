class PeopleMoviesController < ApplicationController
  def show
    @movie = MovieService.create_search_movies(params[:query])
  end
end
