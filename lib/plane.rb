class Plane
  attr_reader :registration
  def initialize(registration)
    @registration = registration
    @flying = false
  end

  def flying?
    @flying
  end

  def change_flying_status
    @flying = !@flying
  end
end
