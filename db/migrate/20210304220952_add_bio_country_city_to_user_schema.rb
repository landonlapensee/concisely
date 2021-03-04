class AddBioCountryCityToUserSchema < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end
