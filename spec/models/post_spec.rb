require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validations" do
    let(:post) { FactoryGirl.build(:post)}
    it 'is an instance of Post' do
      expect(subject).to be_an Post
    end
    it 'has a valid factory' do
      expect(post).to be_valid
    end    
  end
end
