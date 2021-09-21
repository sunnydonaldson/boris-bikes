require_relative './bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    @bikes.empty? ? (raise "no bikes") : Bike.new
  end

  def dock(bike)
    @bikes.length < @capacity ? @bikes << bike : (raise "Docking station full")
  end
end