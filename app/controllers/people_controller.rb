class PeopleController < ApplicationController
  def index
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new(person_params)
  end

  def create
    person = Person.new(person_params)
    if person.save
      redirect_to person_path(person.id)
      flash[:success] = "Welcome, #{person.name}!"
    else
      message = person.errors.full_messages.to_sentence
      redirect_to '/register'
      flash[:alert] = "Error: #{message}"
    end
  end

  def movies
    @person = Person.find(params[:id])
    @facade = MovieFacade.new.search(params[:query])
  end

  private

  def person_params
    params.permit(:id, :name, :email, :password, :password_confirmation)
  end
end
