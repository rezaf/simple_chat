RSpec.describe 'User' do
  describe 'validations' do
    it 'validates name for presence' do
      valid_user = User.new(name: 'John')
      invalid_user = User.new(name: nil)

      expect(valid_user).to be_valid
      expect(invalid_user).to_not be_valid
    end

    it 'validates name for uniqueness' do
      valid_user = User.new(name: 'Jack')
      invalid_user = User.new(name: 'Jon')

      expect(valid_user).to be_valid
      expect(invalid_user).to_not be_valid
    end
  end

  describe '#messages' do
    let(:user) { User.find_by(name: 'Jon') }
    subject(:messages) { user.messages }

    it 'returns a hash with sent and received keys' do
      expect(messages).to be_a Hash
      expect(messages).to include(:sent, :received)
    end

    it 'returns sent messages in the correct format' do
      expect(messages[:sent].first).to include(
        :timestamp,
        recipient: 'Jill',
        body: 'Hi!'
      )
    end

    it 'returns received messages in the correct format' do
      expect(messages[:received].first).to include(
        :timestamp,
        sender: 'Jill',
        body: 'Good day!'
      )
    end
  end
end
