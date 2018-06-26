class AddFeaturedImageToDevos < ActiveRecord::Migration[5.2]
  def change
    add_column :devos, :featured_image, :text
  end
end
