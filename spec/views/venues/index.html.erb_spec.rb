require "rails_helper"
require "spec_helper"

RSpec.describe "venues/index.html.erb", type: :view do

  context "expected elements when index venue" do
    before do
      assign :venues, []
      render
    end
    it {expect(rendered).to match /Add venue/}
  end
end
