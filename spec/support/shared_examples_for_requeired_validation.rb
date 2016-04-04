shared_examples 'field is required' do |klass, attr|
  describe "#{attr}" do
    it "is required" do
      instance = klass.new
      instance.valid?
      expect(instance.errors).to have_key(attr)
    end

    it "without error with field filled" do
      params = {}
      params[attr] = 'My custom string'

      instance = klass.new(params)
      instance.valid?
      expect(instance.errors).not_to have_key(attr)
    end
  end
end
