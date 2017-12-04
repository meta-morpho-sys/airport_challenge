require 'airport'
require 'plane'
require 'weather'

describe 'Air traffic controller' do
  let(:airport) { Airport.new 5 }
  let(:flying_plane) { Plane.new true }

  context 'when airport is full' do
    let(:weather) { Weather.new false }

    it "doesn't land a plane" do
      plane = flying_plane
      airport.capacity.times { airport.land(plane, weather) }
      new_plane = Plane.new true
      expect { airport.land(plane, weather) }.to raise_exception Airport::NO_SPACE_MSG
      expect(airport.planes).to eq [plane, plane, plane, plane, plane]
      expect(new_plane).not_to be_landed
    end
  end

  context 'when weather is sunny' do
    let(:weather) { Weather.new false }

    it 'lands a plane ' do
      plane = flying_plane
      airport.land(plane, weather)
      expect(airport.planes).to eq [plane]
      expect(plane).to be_landed
    end
  end

  context 'when weather is stormy' do
    let(:weather) { Weather.new true }

    it 'prevents a plane from landing ' do
      plane = flying_plane
      expect { airport.land(plane, weather) }
          .to raise_error Airport::LAND_STORMY_WEATHER_MSG
      expect(airport.planes).to eq []
      expect(plane).to be_flying
    end
  end
end
