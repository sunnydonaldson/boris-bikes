class Garage
  DEFAULT_CAPACITY = 50
  attr_reader :storage

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @storage = []
  end

  def receive(bike)
    if full?
      (fail "Garage full")
    else
      @storage.push(bike)
    end
  end

  private
  def full?
    @storage.length >= @capacity
  end
end