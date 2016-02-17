class Album < ActiveRecord::Base

  def sell!(number_sold = 1)
    self.inventory = self.inventory - number_sold
  end

  def price
    base_price * (1 - discount)
  end
end
