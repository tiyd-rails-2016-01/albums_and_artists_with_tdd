class Artist < ActiveRecord::Base
  has_many :albums

  def discount(ratio)
    albums.each {|a| a.discount = ratio}
  end
end
