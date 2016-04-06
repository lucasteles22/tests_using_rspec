require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:post) { create(:post) }
  before(:each) do
    assign(:posts, [post])
  end

  it "renders a list of posts" do
    render
  end
end
