class Album
  attr_reader :name, :inventory

  def initialize(name, inventory, base_price)
    @name = name
    @inventory = inventory
    @base_price = base_price
    @discount = 0
  end

  def sell!(number_sold = 1)
    @inventory -= number_sold
  end

  # Same as `attr_writer :discount`
  def discount=(ratio)
    @discount = ratio
  end

  def price
    @base_price * (1 - @discount)
  end
end
