# PART 1: Include and run the migration.
#
# require './database_configuration.rb'
# require './albums_and_artists_migration.rb'
# AlbumsAndArtistsMigration.migrate(:up)


# PART 2: Require the classes which match up to the database tables.
#
require './database_configuration.rb'
require './album.rb'
require './artist.rb'


# PART 3: Make a new album in memory, and save it to the database at the same time.
#
# a = Album.create(name: "OKCOMPUTER", inventory: 100, base_price: 50, discount: 0)


# PART 4a: Make a new album (just in memory), then edit it, then save it.
#
# b = Album.new(name: "Flying Squirrels", inventory: 10, base_price: 40, discount: 0.1)
# b.discount = 0.2
# b.save


# PART 4b: Make a new album (just in memory), then save it, then edit it.  OOPS!  The new discount never makes it into the database.
#
# b = Album.new(name: "Flying Squirrels", inventory: 10, base_price: 40, discount: 0.1)
# b.save
# b.discount = 0.2


# PART 5: Find an existing album using its id, then change its name, then save it back to the DB.
#
# first_album = Album.find(1)
# first_album.name = "Sinking Squirrels"
# first_album.save


# PART 6: Find an existing album using .where, then change its name, then save it back to the DB.
#
# first_ok_computer = Album.where(name: "OKCOMPUTER").first
# first_ok_computer.name = "MASON WUZ HERE"
# first_ok_computer.save


# PART 7: Find a bunch of albums.  These are stored in a RELATION, which acts a lot like a class, but lets you chain SQL commands.
#
# albums = Album.where(name: "Flying Squirrels").order(:id)
# p albums.class
# albums.each do |a|
#   p a.id
# end


# PART 8: Find an album, then call a method which exists, but which now invokes methods rather than instance variable.  Also note: this is where we MUST HAVE self.inventory, not just inventory.
#
# first_ok_computer = Album.where(name: "OKCOMPUTER").first
# first_ok_computer.sell!(3)
# first_ok_computer.save
# puts first_ok_computer.price


# PART 9: Use an existing method to add an album to an artist.  This is the old way to do it, and won't work with the new code.
#
# artist = Artist.create(name: "The Masontones")
# album = Album.where(name: "OKCOMPUTER").first
#
# album.artist_id = artist.id
# album.save


# artist = Artist.create(name: "The Masontones")
# album = Album.where(name: "OKCOMPUTER").first
# # album.artist = artist
# # album.save
# artist.albums << album
# artist.save














#
