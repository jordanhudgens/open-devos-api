class AddAbbrToBibles < ActiveRecord::Migration[6.1]
  def change
    add_column :bibles, :abbreviation, :string, null: false
  end
end
