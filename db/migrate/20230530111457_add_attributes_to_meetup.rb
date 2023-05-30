class AddAttributesToMeetup < ActiveRecord::Migration[7.0]
  def change
    add_column :meetups, :price, :integer
  end
end
