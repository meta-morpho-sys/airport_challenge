require 'weather'

describe Weather do

  it 'is either stormy or sunny' do
    expect([true, false].include?(subject.stormy?))
  end

  it 'is sunny about 2/3 of the time' do
    NUM_REPS = 100_000
    count = 0
    NUM_REPS.times { count += (subject.stormy? ? 0 : 1) }
    percentage_sunny = 100.0 * count / NUM_REPS
    # expect( count > NUM_REPS * 0.5 ).to be true
    expect(percentage_sunny).to be_between(60, 70)
  end

  it 'can be made stormy' do
    weather = Weather.new true
    expect(weather).to be_stormy
  end

  it 'can be made sunny' do
    weather = Weather.new false
    expect(weather).not_to be_stormy
  end

end
