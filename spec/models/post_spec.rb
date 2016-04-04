require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validations" do
    let(:post) { create(:post) }
    it 'is an instance of Post' do
      expect(subject).to be_an Post
    end

    include_examples 'field is required', Post, :title
    include_examples 'field is required', Post, :body
  end
end
