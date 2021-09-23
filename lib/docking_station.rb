require_relative './bike'

class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      (fail "No bikes")
    else
      @bikes.last.working? ? @bikes.pop : (fail "No working bikes")
    end
  end

  def dock(bike)
    if full?
      (fail "Docking station full")
    else
      bike.working? ? @bikes.push(bike) : @bikes.unshift(bike)
    end
  end

  private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end 

end