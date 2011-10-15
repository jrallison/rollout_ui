require 'spec_helper'

describe "Engine" do
  describe "GET /rollout" do
    it "displays the index" do
      visit "/rollout"
      page.should have_content("Rollout!")
    end
  end
end

