class AddProfileSlugToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_slug, :string
    add_column :users, :slug, :string
  end
end
