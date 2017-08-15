jon = User.create!(name: 'Jon')
jill = User.create!(name: 'Jill')

Message.create!(sender: jon, recipient: jill, body: 'Hi!')
Message.create!(sender: jill, recipient: jon, body: 'Good day!')
