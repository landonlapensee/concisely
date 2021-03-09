class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :recipient, null: false, foreign_key: {to_table: :users}
      t.references :sender, null: false, foreign_key: {to_table: :users}
      t.string :content

      t.timestamps
    end
  end
end
