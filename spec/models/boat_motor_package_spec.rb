require 'spec_helper'

describe BoatMotorPackage do
  it { should validate_presence_of(:boat)}
  it { should validate_presence_of(:motor)}
  it { should validate_presence_of(:price_in_cents)} 
  it { should validate_presence_of(:brand)} 
end