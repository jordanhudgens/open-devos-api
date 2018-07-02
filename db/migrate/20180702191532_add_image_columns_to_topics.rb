class AddImageColumnsToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :thumbnail, :string
    add_column :topics, :banner, :string
  end
end
