require_relative './bike'

class DockingStation
  attr_reader :bikes


  def initialize
    @bikes = []
    @capacity = 20
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