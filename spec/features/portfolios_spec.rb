require 'rails_helper'

RSpec.describe "Portfolio", type: :feature do
    describe "adding a new job" do
        it "should require to be logged in to manage" do
            visit jobs_path
            expect(page).to_not have_css("forms")
        end

        it "should be possible to add new job after logging in" do
            visit "/admin"
            fill_in "password", with: ENV["PASSWORD"]
            find('input').send_keys "enter"
        end
    end
end
