class RemoveUserFromDevos < ActiveRecord::Migration[5.2]
  def change
    remove_reference :devos, :user
  end
end
