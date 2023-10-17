require "1_mine"

describe "My solution for flattened_keys" do

  it "Should flatten the unflattened hash {id: 1, info: {name: 'example'}} to {id: 1, info_name: 'example'}" do
    expect({id: 1, info: {name: 'example'}}.flattened_keys).to eq({id: 1, info_name: 'example'})
  end

  it "Should flatten the unflattened hash {id: 1, info: {name: 'example', more_info:{count: 1}}} to {id: 1, info_name: 'example', info_more_info_count: 1}" do
    expect({id: 1, info: {name: 'example', more_info:{count: 1}}}.flattened_keys).to eq({id: 1, info_name: 'example', info_more_info_count: 1})
  end

  it "Should flatten the unflattened hash {a: 1, 'b' => 2, info: {id: 1, 'name' => 'example'}} to {a: 1, 'b' => 2, info_id: 1, 'info_name' => 'example'}" do
    expect({a: 1, 'b' => 2, info: {id: 1, 'name' => 'example'}}.flattened_keys).to eq({a: 1, 'b' => 2, info_id: 1, 'info_name' => 'example'})
  end

end
