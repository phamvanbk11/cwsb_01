require "rails_helper"
require "spec_helper"

RSpec.describe "venues/edit.html.erb", type: :view do
  context "expected elements when edit venue" do
    before do
      assign :venue, FactoryGirl.create(:venue)
      render
    end
    it {expect(rendered).to match /DETAIL/}
    it {expect(rendered).to match /VENUE/}
    it {expect(rendered).to match /Markers/}
    it {expect(rendered).to match /Map/}
    it {expect(rendered).to match /Update Venue/}
  end
end
