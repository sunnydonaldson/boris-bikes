VAN_DEFAULT_CAPACITY = 5
class Van
  attr_reader :bikes
  def initialize(capacity = VAN_DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect(location)
    until location.bikes.empty? || location.bikes.first.working? do
      @bikes.push(location.bikes.shift)
    end
  end

  def deliver(location)
    fail "Location full" if location.full?
    @bikes.pop
  end
end