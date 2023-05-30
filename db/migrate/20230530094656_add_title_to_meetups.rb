class AddTitleToMeetups < ActiveRecord::Migration[7.0]
  def change
    add_column :meetups, :title, :string
  end
end
