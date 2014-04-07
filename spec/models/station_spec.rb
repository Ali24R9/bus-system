require 'spec_helper'

describe Station do
  it { should validate_presence_of :station_name }
  it { should have_many(:lines).through(:stops) }
end
