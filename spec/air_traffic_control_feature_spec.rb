require 'airport'
require 'plane'
require 'weather'

def maximum_capacity_filled
  airport.land(plane_1, weather)
  airport.land(plane_2, weather)
  airport.land(plane_3, weather)
  airport.land(plane_4, weather)
  airport.land(plane_5, weather)
end

describe 'Air traffic controller' do
  let(:airport) { Airport.new 5 }
  let(:plane_1) { Plane.new true }
  let(:plane_2) { Plane.new true }
  let(:plane_3) { Plane.new true }
  let(:plane_4) { Plane.new true }
  let(:plane_5) { Plane.new true }

  context 'when airport is full' do
    let(:weather) { Weather.new false }

    it 'prevents a plane from landing' do
      maximum_capacity_filled
      new_plane = Plane.new true
      expect { airport.land(new_plane, weather) }.to raise_exception Airport::NO_SPACE_MSG

      landed_planes = [plane_1, plane_2, plane_3, plane_4, plane_5]
      expect(airport.planes).to eq landed_planes
      expect(new_plane).not_to be_landed
    end
  end

  context 'when weather is sunny' do
    let(:weather) { Weather.new false }

    it 'lands a plane ' do
      airport.land(plane_1, weather)
      expect(airport.planes).to eq [plane_1]
      expect(plane_1).to be_landed
    end
  end

  context 'when weather is stormy' do
    let(:weather) { Weather.new true }

    it 'prevents a plane from landing' do
      plane = Plane.new
      expect { airport.land(plane, weather) }
          .to raise_error Airport::LAND_STORMY_WEATHER_MSG
      expect(airport.planes).to eq []
      expect(plane).to be_flying
    end
  end
end
