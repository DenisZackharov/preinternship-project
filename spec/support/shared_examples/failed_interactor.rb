shared_examples "failed interactor" do
  it "failures" do
    interactor.run

    expect(context).to be_failure
    expect(context.error).to eq(error)
  end
end
