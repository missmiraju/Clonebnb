class AddAttributesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :desctription, :string
    add_column :users, :profile_picture_url, :string
    add_column :users, :age, :date
    add_column :users, :gender, :string
  end
end
