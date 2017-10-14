require_relative 'plane'
require_relative 'weather'

class Airport
  CAPACITY = 3
  attr_reader :planes, :weather, :capacity
  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
    @capacity = CAPACITY
  end

  def land(plane)
    fail 'Plane cannot land as weather is too stormy' if @weather.stormy?
    fail 'Plane cannot land as capacity is full' if capacity_full?
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane cannot take off as weather is too stormy' if @weather.stormy?
    @planes.delete(plane)
    plane.change_flying_status
  end

  private
  def capacity_full?
    @planes.length >= @capacity
  end
end
