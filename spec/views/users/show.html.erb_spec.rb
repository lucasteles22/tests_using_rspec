require 'rails_helper'

RSpec.describe "users/show", type: :view do
  let(:user) { create(:user) }
  # it "renders attributes in <p>" do
  #   render
  # end
  it "displays the user title" do
    assign :user, user
    render
    expect(rendered).to have_css("h1", text: user.full_name)
  end
end
