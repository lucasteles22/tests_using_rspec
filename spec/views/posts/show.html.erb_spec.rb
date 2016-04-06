require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:post) { create(:post) }
  # it "renders attributes in <p>" do
  #   render
  # end
  it "displays the user title" do
    assign :post, post
    render
    expect(rendered).to have_css("h1", text: post.title)
  end
end
