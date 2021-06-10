class AddUpcCodeToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :upc_code, :string
  end
end
