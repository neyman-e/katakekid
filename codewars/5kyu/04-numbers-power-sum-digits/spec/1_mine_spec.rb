require "1_mine"

describe "My solution" do

  it "Should return 81 when you pass it 1" do
    expect(power_sumDigTerm(1)).to eq(81)
  end

  it "Should return 512 when you pass it 2" do
    expect(power_sumDigTerm(2)).to eq(512)
  end

  it "Should return 2401 when you pass it 3" do
    expect(power_sumDigTerm(3)).to eq(2401)
  end

  it "Should return 4913 when you pass it 4" do
    expect(power_sumDigTerm(4)).to eq(4913)
  end

end
