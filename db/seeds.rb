# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.destroy_all
Artist.destroy_all

marc = Artist.create(name: "Marc Broussard", genre: "Soul/Blues", photo_url: "http://upload.wikimedia.org/wikipedia/en/1/12/MarcBroussard.jpg")
marc.songs.create(title: "Lonely Night in Georgia", year: 2004)
marc.songs.create(title: "Home", year: 2004)
marc.songs.create(title: "Wanderer", year: 2004)
marc.songs.create(title: "Save Me", year: 2004)
marc.songs.create(title: "Beauty of Who You Are", year: 2004)
marc.songs.create(title: "Rocksteady", year: 2004)
marc.songs.create(title: "Let Me Leave", year: 2004)

wakey = Artist.create(name: "Wakey Wakey", genre: "Alternative Pop", photo_url:"http://carriemervine.files.wordpress.com/2010/01/01-wakey-wakey-tt-the-bears-place-cambridge21.jpg")
wakey.songs.create(title: "Light Outside")
wakey.songs.create(title: "Brooklyn")
wakey.songs.create(title: "War Sweater")

