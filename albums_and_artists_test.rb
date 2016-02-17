require 'minitest/autorun'
require 'minitest/pride'

require 'active_record'
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'test.sqlite3'
)

require './albums_and_artists_migration.rb'
require './artist.rb'
require './album.rb'

class AlbumsAndArtistsTest < Minitest::Test
  def setup
    AlbumsAndArtistsMigration.migrate(:up)
  end

  def teardown
    AlbumsAndArtistsMigration.migrate(:down)
  end

  def test_classes_exist
    assert Album
    assert Artist
  end

  def test_can_create_album_and_get_its_attributes
    a = Album.new(name: "Daniel B.", inventory: 200, base_price: 15)
    assert a
    assert_equal "Daniel B.", a.name
    assert_equal 200, a.inventory
    assert_equal 15, a.price
  end

  def test_can_sell_album
    a = Album.new(name: "Daniel B.", inventory: 200, base_price: 15)
    a.sell!
    assert_equal 199, a.inventory
  end

  def test_can_sell_lots_of_albums
    a = Album.new(name: "Daniel B.", inventory: 200, base_price: 15)
    a.sell!(4)
    assert_equal 196, a.inventory
  end

  def test_can_discount_album
    a = Album.new(name: "Daniel B.", inventory: 200, base_price: 15)
    a.discount = 0.1
    assert_equal 13.5, a.price
  end

  def test_can_create_artist_and_get_attributes
    a = Artist.new(name: "The Masontones")
    assert a
    assert_equal "The Masontones", a.name
  end

  def test_artist_can_receive_album
    album = Album.new(name: "Chaos in Space", inventory: 10, base_price: 24)
    artist = Artist.new(name: "The Masontones")
    artist.albums << album
    assert_equal [album], artist.albums
  end

  def test_artist_catalog_can_be_discounted
    album = Album.new(name: "Chaos in Space", inventory: 10, base_price: 20)
    album2 = Album.new(name: "More Chaos in Space", inventory: 10, base_price: 30)
    artist = Artist.new(name: "The Masontones")
    artist.albums << album
    artist.albums << album2
    assert_equal [album, album2], artist.albums
    artist.discount(0.1)
    assert_equal 18, album.price
    assert_equal 27, album2.price
  end
end
