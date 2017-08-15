SimpleChat
=========
A simple Sinatra app providing a REST API for async messaging

Installation Guide
------------------
In project root directory run:
```
bundle install
rake db:setup

```

Running the app
---------------
You can run the app with: `ruby simple_chat.rb`

Two endpoints are exposed:
- `/user/:id/messages`
  - You can `GET` a list messages in JSON format for a specific user id from this endpoint
- `/messages`
  - You can `POST` a message here

Running the specs
-----------------
First setup and seed the test database with:
`RACK_ENV=test rake db:setup`

Then run: `rspec`
