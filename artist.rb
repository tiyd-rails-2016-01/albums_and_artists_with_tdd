class Artist < ActiveRecord::Base
  def add_album(a)
    @albums << a
  end

  def discount(ratio)
    @albums.each {|a| a.discount = ratio}
  end
end
