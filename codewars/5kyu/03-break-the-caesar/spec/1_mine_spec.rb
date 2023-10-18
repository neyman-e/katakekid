require "1_mine"

describe "My solution to break the Caesar" do

  it "Find 7 when you pass it 'DAM?'" do
    expect(break_caesar("DAM?")).to eq(7)
  end

  it "Find 5 when you pass it 'Mjqqt, btwqi!'" do
    expect(break_caesar("Mjqqt, btwqi!")).to eq(5)
  end

  it "Find 7 when you pass it 'DAM? DAM! DAM.'" do
    expect(break_caesar("DAM? DAM! DAM.")).to eq(7)
  end

  it "Find 13 when you pass it 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt.'" do
    expect(break_caesar("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")).to eq(13)
  end

end
