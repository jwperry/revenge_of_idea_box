require 'rails_helper'

RSpec.describe "UserCanViewIndex", type: :feature, js: true do
  describe "GET /" do
    it "displays all ideas" do
      idea1, idea2 = create_list(:idea, 2)
      visit '/'
      expect(current_path).to eq('/')
      sleep(1)
      expect(page).to have_content("Idea Box")
      expect(page).to have_content("All Ideas")
      expect(page).to have_content(idea1.title)
      expect(page).to have_content(idea1.body)
      expect(page).to have_content(idea1.quality)
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to have_content(idea2.quality)
    end
  end
end
