class AddCategory < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :create_category, :boolean
  end
end
