require "rails_helper"
require "spec_helper"

RSpec.describe "venues/new.html.erb", type: :view do
  context "expected elements when new venue" do
    before do
      assign :venue, Venue.new
      render
    end
    it {expect(rendered).to match /Create Venue/}
    it {expect(rendered).to match /Markers/}
    it {expect(rendered).to match /Map/}
  end
end
