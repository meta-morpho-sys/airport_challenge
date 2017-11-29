require 'plane'

describe Plane do
  it 'is in air when initialized' do
    expect(subject).not_to be_landed
  end
  it 'is #flying' do
    expect(subject.flying?).to eq true
  end
  it 'can #land' do
    plane = subject.land
    expect(plane).to be_landed
  end
  it 'is #landed' do
    expect(subject.landed?).to eq false
  end
  it 'can #take off' do
    subject.land
    expect(subject.take_off).to be_flying
  end
  it "doesn't take off twice" do
    expect { subject.take_off }.to raise_exception 'Already flying!!'
  end
end
