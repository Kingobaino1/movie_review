class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :full_name, :string
    add_column :users, :photo, :string
    add_column :users, :cover_image, :string
  end
end
