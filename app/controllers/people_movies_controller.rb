class PeopleMoviesController < ApplicationController
  def show
    # binding.pry
    @person = Person.find(params[:person_id])
    @movie = MovieService.movie_by_keyword(params[:query])
  end
end
