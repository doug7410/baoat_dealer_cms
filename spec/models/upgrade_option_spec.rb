require 'spec_helper'

describe UpgradeOption do
  
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:price_in_cents)}

end