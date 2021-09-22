require_relative './bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  @@hi = 2
  def initialize(num)
    puts @@hi
    @@hi = num
    
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    empty? ? (raise "no bikes") : Bike.new
  end

  def dock(bike)
    full? ? (raise "Docking station full") : @bikes << bike 
  end

  private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end 

end

a = DockingStation.new(1)
b = DockingStation.new(3)

