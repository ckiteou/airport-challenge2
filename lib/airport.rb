require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :weather
  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane cannot take off as weather is too stormy' if @weather.stormy?
    @planes.delete(plane)
    plane.change_flying_status
  end
end
