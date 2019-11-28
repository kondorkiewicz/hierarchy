RSpec.describe Web::Views::Lines::Index do
  let(:exposures) { Hash[lines: []] }
  let(:template) { Hanami::View::Template.new("apps/web/templates/lines/index.html.erb") }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }

  let(:line_entity) do
    Hierarchy::Repositories[:Line].entity_class
  end

  it "exposes #lines" do
    expect(view.lines).to eq(exposures.fetch(:lines))
  end

  context "when there are no lines" do
    it "shows a placeholder message" do
      expect(rendered).to include('<p class="placeholder">There are no lines yet.</p>')
    end
  end

  context "when there are lines" do
    let(:line1) do
      line_entity.new(
        id: 1,
        name: "Refactoring",
        grade: "8A",
        kind: "bouldering",
        crag: "Rodellar",
        created_at: Time.now,
        updated_at: Time.now)
    end

    let(:line2) do
      line_entity.new(
        id: 1,
        name: "Domain Driven Design",
        grade: "8a",
        kind: "lead",
        crag: "Rodellar",
        created_at: Time.now,
        updated_at: Time.now)
    end

    let(:exposures) { Hash[lines: [line1, line2]] }

    it "lists them all" do
      expect(rendered.scan(/class="line"/).length).to eq(2)
      expect(rendered).to include("Refactoring")
      expect(rendered).to include("Domain Driven Design")
    end

    it "hides the placeholder message" do
      expect(rendered).to_not include('<p class="placeholder">There are no lines yet.</p>')
    end
  end
end
