class AddColumnsToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :title, :string
    add_column :opinions, :rating, :integer
    add_column :opinions, :genre, :string
  end
end
