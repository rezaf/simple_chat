class User < ActiveRecord::Base
  has_many :sent_messages,
      class_name: 'Message',
      foreign_key: :sender_id

  has_many :received_messages,
      class_name: 'Message',
      foreign_key: :recipient_id

  validates :name, presence: true, uniqueness: true

  # Returns a hash of the user's messages
  # @return [Hash]
  def messages
    all_messages = {sent: [], received: []}

    sent_messages.includes(:recipient).each do |message|
      all_messages[:sent] << {
        recipient: message.recipient.name,
        body: message.body,
        timestamp: message.created_at
      }
    end

    received_messages.includes(:sender).each do |message|
      all_messages[:received] << {
        sender: message.sender.name,
        body: message.body,
        timestamp: message.created_at
      }
    end

    all_messages
  end
end
