class Garage
  DEFAULT_CAPACITY = 50
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def receive(bike)
    fail "Garage full" if full?
    @bikes.push(bike)
  end

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end