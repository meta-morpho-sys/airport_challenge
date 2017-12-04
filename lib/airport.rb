require_relative 'plane'
require_relative 'weather'

# manages landing and leaving planes. Takes information from Weather class to
# decide whether a plane should land or take off.
class Airport
  DEFAULT_CAPACITY = 100
  LAND_STORMY_WEATHER_MSG = 'Landing denied due to stormy weather'
  TAKE_OFF_STORMY_WEATHER_MSG = 'Take-off denied due to stormy weather'
  NO_SPACE_MSG = 'No available space.'
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    raise LAND_STORMY_WEATHER_MSG if weather.stormy?
    raise NO_SPACE_MSG if full?
    @planes << plane.land
  end

  def take_off(plane, weather)
    raise TAKE_OFF_STORMY_WEATHER_MSG if weather.stormy?
    plane.take_off
    @planes.pop
  end

  private

  def full?
    @planes.size >= capacity
  end
end
