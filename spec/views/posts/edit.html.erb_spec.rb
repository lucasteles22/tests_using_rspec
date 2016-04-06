require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  context "Edit a post" do
    let(:post) { create(:post) }
    before(:each) { visit edit_post_path post }
    before(:all) { 1.times {  create(:user, :email => 'mycustompostuser3@test.com') } }
    after(:all) { User.delete_all }

    scenario "successfully updated" do
      within("#post_form") do
        fill_in 'post_title', :with => post.title
        fill_in 'post_body', :with => post.body
        check 'post_approved'
        within '#post_author_id' do
          find("option[value='#{User.first.id}']").select_option
        end
      end
      click_button 'Update Post'
      expect(page).to have_content 'Post was successfully updated'
    end

    scenario "has blank title" do
      within("#post_form") do
        fill_in 'post_title', :with => ''
        fill_in 'post_body', :with => post.body
        check 'post_approved'
        within '#post_author_id' do
          find("option[value='#{User.first.id}']").select_option
        end
      end
      click_button 'Update Post'
      expect(page).to have_content "Title can't be blank"
    end
    scenario "has blank body" do
      within("#post_form") do
        fill_in 'post_title', :with => post.title
        fill_in 'post_body', :with => ''
        check 'post_approved'
        within '#post_author_id' do
          find("option[value='#{User.first.id}']").select_option
        end
      end
      click_button 'Update Post'
      expect(page).to have_content "Body can't be blank"
    end
  end
end
