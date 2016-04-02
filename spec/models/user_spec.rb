require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    let(:user) { create(:user, :with_post) }
    it 'is an instance of User' do
      expect(subject).to be_an User
    end
  
    it 'has posts' do
      expect(user.posts.count).to eql 3
    end
  end
end
