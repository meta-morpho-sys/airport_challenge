require 'airport'
require 'plane'
require 'weather'

describe 'Air traffic controller' do
  let(:airport) { Airport.new 5 }

  context 'when airport is full' do
    let(:weather) { Weather.new false }
    before(:each) do
      5.times { airport.land(Plane.new, weather) }
    end

    it 'prevents a plane from landing' do
      new_plane = Plane.new true
      expect { airport.land(new_plane, weather) }.to raise_exception Airport::NO_SPACE_MSG
      expect(airport.planes.size).to eq 5
      expect(new_plane).not_to be_landed
    end
  end

  context 'when weather is sunny' do
    let(:weather) { Weather.new false }

    it 'lands a plane ' do
      plane = Plane.new
      airport.land(plane, weather)
      expect(airport.planes).to eq [plane]
      expect(plane).to be_landed
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
