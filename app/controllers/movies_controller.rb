class MoviesController < ApplicationController
  def index
    @movies = if params[:top_movies]
      MovieFacade.create_top_rated_movies
    else
      MovieFacade.create_search_movies(params[:query])
    end
  end

  def discover
    # binding.pry
    @person = Person.find(params[:id])
    @movie = MovieService.create_search_movies(params[:query])
  end

  def show
    # binding.pry
    @person = Person.find(params[:person_id])
    @movie = MovieService.create_search_movies(params[:query])
  end
end
