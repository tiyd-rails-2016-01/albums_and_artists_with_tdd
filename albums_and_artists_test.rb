require 'minitest/autorun'
require 'minitest/pride'

#Note: This line is going to fail first.
require './artist.rb'

class AlbumsAndArtistsTest < Minitest::Test
  def test_classes_exist
    assert Album
    assert Artist
  end

  def test_can_create_album
    assert Album.new("Daniel B.", 200, 15)
  end

  def test_can_sell_album
    a = Album.new("Daniel B.", 200, 15)
    a.sell!
    assert_equal 199, a.number
  end
end
