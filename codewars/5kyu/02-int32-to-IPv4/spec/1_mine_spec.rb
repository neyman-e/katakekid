require "1_mine"

describe "My solution" do

  it "Should return '128.32.10.1' when you pass it 2149583361" do
    expect(int32_to_ip(2149583361)).to eq("128.32.10.1")
  end

  it "Should return '0.0.0.32' when you pass it 32" do
    expect(int32_to_ip(32)).to eq("0.0.0.32")
  end

  it "Should return '0.0.0.0' when you pass it 0" do
    expect(int32_to_ip(0)).to eq("0.0.0.0")
  end

  it "Other basic tests" do
    expect(int32_to_ip(2154959208)).to eq("128.114.17.104")
  end

end
