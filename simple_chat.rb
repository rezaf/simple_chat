require 'bundler'
Bundler.require
Bundler.require(settings.environment)

require_rel 'models'

set :port, 9000
set :database, {adapter: "sqlite3", database: "simple_chat.sqlite3"}

get '/user/:id/messages' do
  user_id = params[:id]

  if user = User.find_by(id: user_id)
    user.messages.to_json
  else
    {error: 'Cannot find user!'}.to_json
  end
end

post '/messages' do
  sender = User.find_by(name: params[:sender])
  recipient = User.find_by(name: params[:recipient])

  if sender && recipient
    Message.create!(sender: sender, recipient: recipient, body: params[:body])
    {status: 'Success!'}.to_json
  else
    {error: 'User does not exist!'}.to_json
  end
end
