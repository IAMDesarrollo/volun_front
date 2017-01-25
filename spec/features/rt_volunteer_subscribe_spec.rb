require 'rails_helper'

feature 'rt volunteer subscribe' do

  

  context "Proposals" do
    scenario "Shows moderation activity on proposals", :js do
      proposal = create(:proposal)

      visit proposal_path(proposal)

      within("#proposal_#{proposal.id}") do
        click_link 'Hide'
      end

      visit admin_activity_path

      within("#activity_#{Activity.last.id}") do
        expect(page).to have_content(proposal.title)
        expect(page).to have_content("Hidden")
        expect(page).to have_content(@admin.user.username)
      end
    end

    
  

end