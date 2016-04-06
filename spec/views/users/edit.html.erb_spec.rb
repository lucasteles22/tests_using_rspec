require 'rails_helper'

RSpec.describe "users/new", type: :view do
  context "Create a new user" do
    let(:user) { create(:user) }
    before(:each) { visit edit_user_path user }

    scenario "successfully updated" do
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_first_name', :with => 'My custom'
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Update User'
      expect(page).to have_content 'User was successfully updated'
    end

    scenario "has alread been registered" do
      another_user = create(:user, :email => 'test@test.com')
      within("#user_form") do
        fill_in 'user_email', :with => another_user.email
        fill_in 'user_first_name', :with => user.first_name
        fill_in 'user_last_name', :with => user.last_name
      end
      click_button 'Update User'
      expect(page).to have_content 'Email has already been taken'
    end

    scenario "has blank first_name" do
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_first_name', :with => ''
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Update User'
      expect(page).to have_content "First name can't be blank"
    end

    scenario "has blank last_name" do
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_first_name', :with => 'My custom'
        fill_in 'user_last_name', :with => ''
      end
      click_button 'Update User'
      expect(page).to have_content "Last name can't be blank"
    end

    scenario "has blank email" do
      within("#user_form") do
        fill_in 'user_email', :with => ''
        fill_in 'user_first_name', :with => 'My custom'
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Update User'
      expect(page).to have_content "Email can't be blank"
    end
  end
end
