shared_examples 'email is required' do |klass, attr|
  describe "#{attr}" do
    it "is required" do
      instance = klass.new
      instance.valid?
      expect(instance.errors).to have_key(attr)
    end

    it "without error with field filled correctly" do
      params = {}
      params[attr] = 'test@test.com'

      instance = klass.new(params)
      instance.valid?
      expect(instance.errors).not_to have_key(attr)
    end

    it "with error with field filled incorrectly" do
      params = {}
      params[attr] = 'test test test'

      instance = klass.new(params)
      instance.valid?
      expect(instance.errors).to have_key(attr)
    end
  end
end
