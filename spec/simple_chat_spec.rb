RSpec.describe 'Simple Chat App' do

  describe 'GET /user/:id/messages' do

    context 'when user present' do
      it 'responds with messages for that user' do
        get '/user/1/messages'
        response = JSON.parse(last_response.body)

        expect(response).to be_a Hash
        expect(response).to include('sent', 'received')
      end
    end

    context 'when user cannot be found' do
      it 'responds with error message' do
        get '/user/1000/messages'

        expect(JSON.parse(last_response.body)).to eq(
          {'errors' => 'Cannot find user!'}
        )
      end
    end

  end

  describe 'POST /messages' do

    context 'when message can be created' do
      it 'responds with sucess message' do
        json = {sender: 'Jill', recipient: 'Jon', body: 'Hi Jon!'}
        post '/messages', json, {CONTENT_TYPE: 'application/json'}

        expect(JSON.parse(last_response.body)).to eq(
          {'status' => 'Message sent!'}
        )
      end
    end

    context 'when message cannot be created' do
      it 'responds with error message' do
        json = {sender: 'No one', recipient: 'No body', body: 'Hi Jon!'}
        post '/messages', json, {CONTENT_TYPE: 'application/json'}

        expect(JSON.parse(last_response.body)).to eq(
          {
            'errors' => {
              'sender' => ["can't be blank"],
              'recipient' => ["can't be blank"]
            }
          }
        )
      end
    end

  end

end
