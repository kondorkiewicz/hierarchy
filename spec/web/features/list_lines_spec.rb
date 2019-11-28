require "features_helper"

RSpec.describe "List lines" do
  let(:repository) do
    Hierarchy::Repositories[:Line]
  end

  before do
    repository.clear

    repository.create(name: "Gruby balet", grade: "8B", kind: "boulder")
    repository.create(name: "Odlot Małpy", grade: "VI 5", kind: "lead")
  end

  it "displays each line on the page" do
    visit "/lines"

    within "#lines" do
      expect(page).to have_selector(".line", count: 2), "Expected to find 2 lines"
    end
  end
end
