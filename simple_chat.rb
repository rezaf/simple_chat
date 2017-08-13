require 'bundler'
Bundler.require

require_rel 'models'

set :port, 9000
set :database, {adapter: "sqlite3", database: "simple_chat.sqlite3"}

get '/user/:id/messages' do
  user_id = params[:id]

  if user = User.find_by_id(user_id)
    user.messages.to_json
  else
    {error: 'Cannot find user!'}.to_json
  end
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
