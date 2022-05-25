require "rails_helper"

RSpec.describe "Movie Detail Page" do
  it "has a button to create a viewing party", :vcr do
    movie1 = Movie.new(title: "Who Killed Mike Dao", vote_average: 10, id: 20)

    visit '/discover'

    fill_in :query, with: "Who Killed Mike Dao"
    click_button "Find Movies"

    expect(current_path).to eq("/discover/movies")

    click_button "Create Viewing Party for #{movie1.title}"

    expect(current_path).to eq(new_person_party_path)
  end

  it "has a button to return to Discover Page" do
    movie1 = Movie.new(title: "Who Killed Mike Dao", vote_average: 10, id: 20)

    visit '/discover'

    click_button "Discover Page"

    expect(current_path).to eq(discover_path)
  end

  it "displays movie information" do
    movie1 = Movie.new(title: "Who Killed Mike Dao", vote_average: 10, id: 20)

    visit '/discover'

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.vote_average)
    expect(page).to have_content(movie.runtime)
    expect(page).to have_content(movie.genre)
    expect(page).to have_content(movie.summary)
    expect(page).to have_content(movie.cast_members)
    expect(page).to have_content(movie.review_count)
    expect(page).to have_content(movie.review_author_info)
  end
end
