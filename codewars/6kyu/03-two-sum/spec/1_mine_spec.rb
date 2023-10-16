require "1_mine"

describe "My persistence" do

  it "Should return [0, 2] when you pass it ([1, 2, 3], 4)" do
    expect(two_sum([1, 2, 3], 4)).to eq([0, 2])
  end

  it "Should return [1, 2] when you pass it ([1234, 5678, 9012], 14690)" do
    expect(two_sum([1234, 5678, 9012], 14690)).to eq([1, 2])
  end

  it "Other basic tests" do
    expect(two_sum([2, 2, 3], 4)).to eq([0, 1])
  end

end
