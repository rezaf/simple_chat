class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :sender, null: false
      t.references :recipient, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
