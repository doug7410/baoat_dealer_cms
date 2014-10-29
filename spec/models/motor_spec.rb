require 'rails_helper'

describe Motor do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:hp)}
  it { should validate_presence_of(:shaft)} 
  it { should validate_presence_of(:motor_type)} 
  it { should validate_presence_of(:brand)} 

  

end