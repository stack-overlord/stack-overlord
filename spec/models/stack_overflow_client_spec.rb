describe StackOverflowApiClient do
  let(:client){StackOverflowApiClient.new("some query")}
  it "should initialize with query" do
    expect(client.query).to eq("some query")
  end

  it ""
end
