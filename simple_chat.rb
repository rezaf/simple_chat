require 'bundler'
Bundler.require
Bundler.require(settings.environment)

require_rel 'models'

set :port, 9000
set :database, {
  adapter: 'sqlite3',
  database: "simple_chat_#{settings.environment}.sqlite3"
}

get '/user/:id/messages' do
  content_type :json

  user_id = params[:id]

  if user = User.find_by(id: user_id)
    user.messages.to_json
  else
    {errors: 'Cannot find user!'}.to_json
  end
end

post '/messages' do
  content_type :json

  sender = User.find_by(name: params[:sender])
  recipient = User.find_by(name: params[:recipient])

  message = Message.create(
    sender: sender,
    recipient: recipient,
    body: params[:body]
  )

  if message.errors.empty?
    {status: 'Message sent!'}.to_json
  else
    {errors: message.errors}.to_json 
  end
end
