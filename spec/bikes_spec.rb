require 'bike'

describe Bike do
  it 'responds_to working?' do
    expect(subject).to respond_to :working?
  end
end