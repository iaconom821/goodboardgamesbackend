class AddImagesToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :image, :string
  end
end
