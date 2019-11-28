RSpec.describe Web::Controllers::Lines::Index do
  let!(:line) { repository.create(name: "Kundapura", grade: "8c+", kind: "lead") }

  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) { Hierarchy::Repositories[:Line] }

  after do
    repository.clear
  end

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it "exposes all lines" do
    action.call(params)
    expect(action.exposures[:lines]).to eq([line])
  end
end
