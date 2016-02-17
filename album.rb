class Album < ActiveRecord::Base
  belongs_to :artist

  def sell!(number_sold = 1)
    self.inventory = inventory - number_sold
  end

  def price
    base_price * (1 - (discount || 0))
  end
end
