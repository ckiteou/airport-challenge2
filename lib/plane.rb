class Plane

  attr_reader :flying, :registration
  def initialize(registration)
    @registration = registration
    @flying = false
  end

  def change_flying_status
    @flying = !@flying
  end
end
