require 'spec_helper'

describe Brand do
  
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:logo)}
  it { should validate_presence_of(:description)}

end