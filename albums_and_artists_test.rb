require 'minitest/autorun'
require 'minitest/pride'

#Note: This line is going to fail first.
require './artist.rb'

class AlbumsAndArtistsTest < Minitest::Test
  def test_classes_exist
    assert Album
    assert Artist
  end
end
