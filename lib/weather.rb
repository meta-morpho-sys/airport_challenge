# responsible for the weather conditions
class Weather

  def initialize(stormy = nil)
    @stormy = stormy
  end

  def stormy?
    return (random_forecast == :stormy) if @stormy.nil?
    @stormy
  end

  private

  FORECAST = [:stormy, :sunny, :sunny].freeze

  def random_forecast
    FORECAST.sample
  end
end
