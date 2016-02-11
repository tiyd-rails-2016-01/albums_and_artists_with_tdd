class Album
  attr_reader :number

  def initialize(name, number, price)
    @name = name
    @number = number
    @price = price
  end

  def sell!
    @number -= 1
  end
end
