# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# cannot include more than 50 songs per call
api = SpotifyService.new
api.build_songs(0..49)
api.build_songs(50..99)
api.build_songs(100..149)
api.build_songs(150..198)
api.build_songs(198..200)