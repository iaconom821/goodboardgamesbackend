class CreateBoardgames < ActiveRecord::Migration[6.1]
  def change
    create_table :boardgames do |t|
      t.string :title
      t.string :manufacturer
      t.string :description

      t.timestamps
    end
  end
end
