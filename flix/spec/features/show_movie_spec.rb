require "spec_helper"

describe "Viewing an individual movie" do
	it "shows the movie's details" do
		movie = Movie.create(movie_attributes)

		visit movie_url(movie.id)

		expect(page).to have_text(movie.title)
  		expect(page).to have_text(movie.rating)
  		expect(page).to have_text(movie.description)
  		expect(page).to have_text(movie.released_on)
	end

  it "it shows the total_gross if total_gross exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000))

    visit movie_url(movie.id)

    expect(page).to have_text("$60,000,000.00")
  end

  it "shows 'Flop!' if total_gross is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 1000))

    visit movie_url(movie.id)

    expect(page).to have_text("Flop!")
  end
end