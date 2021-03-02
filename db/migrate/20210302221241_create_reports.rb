class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.date :date
      t.text :description
      t.float :rating
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
