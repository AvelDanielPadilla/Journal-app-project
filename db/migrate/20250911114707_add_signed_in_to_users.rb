class AddSignedInToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :signed_in, :boolean
  end
end
