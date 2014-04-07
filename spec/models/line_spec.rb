require 'spec_helper'

describe Line do
  it { should validate_presence_of :line_number}
  it { should have_many(:stations).through(:stops)}
end
