class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, null: false
      t.references :recipient, null: false
      t.text :body, null: false
      t.index :sender_id
      t.index :recipient_id

      t.timestamps null: false
    end
  end
end
