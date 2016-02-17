require 'minitest/autorun'
require 'minitest/pride'

#Note: This line is going to fail first.
require './artist.rb'

class AlbumsAndArtistsTest < Minitest::Test
  def test_classes_exist
    assert Album
    assert Artist
  end

  def test_can_create_album_and_get_its_attributes
    a = Album.new("Daniel B.", 200, 15)
    assert a
    assert_equal "Daniel B.", a.name
    assert_equal 200, a.inventory
    assert_equal 15, a.price
  end

  def test_can_sell_album
    a = Album.new("Daniel B.", 200, 15)
    a.sell!
    assert_equal 199, a.inventory
  end

  def test_can_sell_lots_of_albums
    a = Album.new("Daniel B.", 200, 15)
    a.sell!(4)
    assert_equal 196, a.inventory
  end

  def test_can_discount_album
    a = Album.new("Daniel B.", 200, 15)
    a.discount = 0.1
    assert_in_delta 13.5, a.price, 0.001
  end

  def test_can_create_artist_and_get_attributes
    a = Artist.new("The Masontones")
    assert a
    assert_equal "The Masontones", a.name
  end

  def test_artist_can_receive_album
    album = Album.new("Chaos in Space", 10, 24)
    artist = Artist.new("The Masontones")
    artist.add_album(album)
    assert_equal [album], artist.albums
  end

  def test_artist_catalog_can_be_discounted
    album = Album.new("Chaos in Space", 10, 20)
    album2 = Album.new("More Chaos in Space", 10, 30)
    artist = Artist.new("The Masontones")
    artist.add_album(album)
    artist.add_album(album2)
    assert_equal [album, album2], artist.albums
    artist.discount(0.1)
    assert_equal 18, album.price
    assert_equal 27, album2.price
  end
end
