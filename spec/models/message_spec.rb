RSpec.describe 'Message' do
  let(:jon) { User.find_by(name: 'Jon') }
  let(:jill) { User.find_by(name: 'Jill') }

  it 'validates sender for presence' do
    message = Message.new(sender: nil, recipient: jill, body: 'Testing 1, 2')
    expect(message).to be_invalid
  end

  it 'validates recipient for presence' do
    message = Message.new(sender: jon, recipient: nil, body: 'Testing 1, 2')
    expect(message).to be_invalid
  end

  it 'validates body for presence' do
    message = Message.new(sender: jon, recipient: jill, body: nil)
    expect(message).to be_invalid
  end
end
