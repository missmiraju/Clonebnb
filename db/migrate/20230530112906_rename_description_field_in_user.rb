class RenameDescriptionFieldInUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :desctription, :description
  end
end
