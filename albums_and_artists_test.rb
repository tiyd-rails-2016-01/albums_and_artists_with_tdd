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
end
