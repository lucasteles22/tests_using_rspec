require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  context "Create a new post" do
    let(:post) { create(:post) }
    let(:user) { create(:user, :email => 'mycustompostuser@test.com') }

    before(:all) { 1.times {  create(:user, :email => 'mycustompostuser2@test.com') } }
    after(:all) { User.delete_all }

    scenario "has not title" do
      visit '/posts/new'
      within("#post_form") do
        fill_in 'post_title', :with => post.title
        fill_in 'post_body', :with => post.body
        check 'post_approved'

        # select User.first.id, :from => "post_author_id"
        find('#post_author_id').find(:xpath, 'option[1]').select_option
      end
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created'
    end
  end
end
