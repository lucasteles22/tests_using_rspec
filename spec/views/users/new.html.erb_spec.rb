require 'rails_helper'

RSpec.describe "users/new", type: :view do
  context "Create a new user" do
    scenario "has not alread been registered" do
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_first_name', :with => 'My custom'
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Create User'
      expect(page).to have_content 'User was successfully created'
    end

    scenario "has alread been registered" do
      user = create(:user)
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_email', :with => user.email
        fill_in 'user_first_name', :with => user.first_name
        fill_in 'user_last_name', :with => user.last_name
      end
      click_button 'Create User'
      expect(page).to have_content 'Email has already been taken'
    end

    scenario "has not first_name" do
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Create User'
      expect(page).to have_content "First name can't be blank"
    end

    scenario "has not last_name" do
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_first_name', :with => 'My custom'
      end
      click_button 'Create User'
      expect(page).to have_content "Last name can't be blank"
    end

    scenario "has not email" do
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_first_name', :with => 'My custom'
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Create User'
      expect(page).to have_content "Email can't be blank"
    end

    scenario "has blank first_name" do
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_first_name', :with => ''
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Create User'
      expect(page).to have_content "First name can't be blank"
    end

    scenario "has blank last_name" do
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_email', :with => 'my_email_test@test.com'
        fill_in 'user_first_name', :with => 'My custom'
        fill_in 'user_last_name', :with => ''
      end
      click_button 'Create User'
      expect(page).to have_content "Last name can't be blank"
    end

    scenario "has blank email" do
      visit '/users/new'
      within("#user_form") do
        fill_in 'user_email', :with => ''
        fill_in 'user_first_name', :with => 'My custom'
        fill_in 'user_last_name', :with => 'New user'
      end
      click_button 'Create User'
      expect(page).to have_content "Email can't be blank"
    end
  end
end
