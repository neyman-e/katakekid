require "1_mine"

describe "My solution" do

  it "Should return 'camel Casing' when we pass 'camelCasing' to it" do
    expect(solution('camelCasing')).to eq('camel Casing')
  end

  it "Should return 'camel Casing Test' when we pass 'camelCasingTest' to it" do
    expect(solution('camelCasingTest')).to eq('camel Casing Test')
  end

end
