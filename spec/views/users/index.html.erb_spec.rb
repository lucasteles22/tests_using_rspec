require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:users, [user])
  end

  it "renders a list of users" do
    render
  end
end
