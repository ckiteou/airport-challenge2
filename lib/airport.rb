require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity
  def initialize(capacity = 20, weather: Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise 'Plane cannot land as weather is too stormy' if @weather.stormy?
    raise 'Plane cannot land as capacity is full' if capacity_full?
    @planes << plane
  end

  def take_off(plane)
    raise 'Plane cannot take off as weather is too stormy' if @weather.stormy?
    @planes.delete(plane)
    plane.change_flying_status
  end

  private
  
  def capacity_full?
    @planes.length >= @capacity
  end
end
