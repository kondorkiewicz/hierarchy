RSpec.describe Web::Controllers::Lines::Create do
  let(:action) { described_class.new }

  let(:repository) do
    Hierarchy::Repositories[:Line]
  end

  before do
    repository.clear
  end

  context "with valid params" do
    let(:params) { Hash[line: { name: "Kundapura", grade: "8c+", kind: "lead" }] }

    it "creates a new line" do
      action.call(params)
      line = repository.last

      expect(line.id).to_not be_nil
      expect(line.name).to eq(params.dig(:line, :name))
    end

    it "redirects the user to the lines listing" do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]["Location"]).to eq("/lines")
    end
  end

  context "with invalid params" do
    let(:params) { Hash[line: {}] }

    it "returns HTTP client error" do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it "dumps errors in params" do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:line, :name)).to eq(["is missing"])
      expect(errors.dig(:line, :grade)).to eq(["is missing"])
      expect(errors.dig(:line, :kind)).to eq(["is missing"])
    end
  end
end
