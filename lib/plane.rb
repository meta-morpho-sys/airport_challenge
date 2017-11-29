# holds the state of a plane
class Plane
  attr_reader :landed

  def initialize(flying = true)
    @landed = !flying
  end

  def flying?
    !@landed
  end

  def landed?
    @landed
  end

  def land
    @landed = true
    self
  end

  def take_off
    raise 'Already flying!!' if flying?
    @landed = false
    self
  end
end
