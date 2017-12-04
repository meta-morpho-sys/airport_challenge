require './airport'
require './plane'
require 'rspec/mocks/standalone'

sunny_weather = double(:weather)
allow(sunny_weather).to receive(:stormy?) { false }

airport = Airport.new 380
plane = Plane.new
plane.flying?

airport.land(plane, sunny_weather)
plane.landed?
airport.take_off(plane, sunny_weather)
plane.flying?
