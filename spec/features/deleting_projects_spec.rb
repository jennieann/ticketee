require "rails_helper"

RSpec.feature "User can delete existing projects" do
  scenario "successfully" do
    FactoryGirl.create(:project, name: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
    click_link "Delete Project"

    expect(page).to have_content "Project has been deleted"
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content "sublime Text 3"

  end
end