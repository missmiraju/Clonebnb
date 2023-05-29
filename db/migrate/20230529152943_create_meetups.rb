class CreateMeetups < ActiveRecord::Migration[7.0]
  def change
    create_table :meetups do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
