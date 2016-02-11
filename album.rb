class Album
  attr_reader :name, :inventory, :price

  def initialize(name, inventory, price)
    @name = name
    @inventory = inventory
    @price = price
  end

  def sell!(number_sold = 1)
    @inventory -= number_sold
  end
end
