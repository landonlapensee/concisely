class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :industry
      t.float :price

      t.timestamps
    end
  end
end
