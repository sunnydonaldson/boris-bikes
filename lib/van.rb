VAN_DEFAULT_CAPACITY = 5
class Van
  attr_reader :storage
  def initialize(capacity = VAN_DEFAULT_CAPACITY)
    @capacity = capacity
    @storage = []
  end

  def collect(location)
    p location.bikes.first
    until location.bikes.empty? || location.bikes.first.working? do
      @storage.push(location.bikes.shift)
    end
  end

end