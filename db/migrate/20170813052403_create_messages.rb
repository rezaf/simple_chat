class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, index: true, null: false
      t.references :recipient, index: true, null: false
      t.text :body, null: false
      t.timestamps null: false
    end
  end
end
