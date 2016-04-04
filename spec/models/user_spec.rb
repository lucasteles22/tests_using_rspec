require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    let(:user) { create(:user, :with_post) }
    
    it 'is an instance of User' do
      expect(subject).to be_an User
    end

    describe "#first_name" do
      it "is required" do
        user.first_name = nil
        user.valid?
        expect(user.errors).to have_key(:first_name)
      end
    end

    it 'has posts' do
      expect(user.posts.count).to eql 3
    end
  end

  context "has first_name and last_name" do
    let(:user) { create(:user, :with_post) }
    describe "#full_name" do
      it "is filled" do
        expect(user.full_name).to eql 'Lucas Teles'
      end
    end
  end

  context "has no first_name and last_name" do
    subject do
      User.new
    end
    describe "#full_name" do
      it "is nil" do
        expect(subject.full_name).to be_nil
      end
    end
  end
end
