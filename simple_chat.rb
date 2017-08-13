require 'bundler'

Bundler.require

set :port, 9000
set :database, {adapter: "sqlite3", database: "simple_chat.sqlite3"}

# user table
## id, name, time_stamps
# messages table
## id, sender_id, recipient_id, body, time_stamps

# Read messages for user from DB
# Send json of messages to client
# {id: {name:, received_bool:, body:, time:}}
get '/messages/:id' do
  user_id = params[:id]

end

# {
#   from_user: id,
#   to_user: id,
#   message: text
# }
# Persist message to DB
# Let client know of success
post '/messages' do

end
