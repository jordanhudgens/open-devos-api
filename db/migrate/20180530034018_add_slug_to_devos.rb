class AddSlugToDevos < ActiveRecord::Migration[5.2]
  def change
    add_column :devos, :slug, :string
  end
end
