class RemoveFeaturedImageFromDevos < ActiveRecord::Migration[5.2]
  def change
    remove_column :devos, :featured_image, :text
  end
end
