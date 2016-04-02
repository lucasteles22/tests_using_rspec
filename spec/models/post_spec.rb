require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validations" do
    let(:post) { create(:post) }
    it 'is an instance of Post' do
      expect(subject).to be_an Post
    end
  end
end
