# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'net/http'
require 'json'

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{Rails.application.credentials.tmdb[:api_key]}&language=en-US&page=1"
response = Net::HTTP.get_response(URI(url))
api_data = JSON.parse(response.body)

puts "planting Movie seeds"

api_data["results"].each do |hash|
  Movie.create(
    title: hash["title"],
    overview: hash["overview"],
    poster_url: hash["poster_path"],
    rating: hash["vote_average"]
  )
end

puts "Movie seeds planted!"

