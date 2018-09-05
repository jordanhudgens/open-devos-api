class CreateDevoCompletions < ActiveRecord::Migration[5.2]
  def change
    create_table :devo_completions do |t|
      t.references :user, foreign_key: true
      t.references :devo, foreign_key: true

      t.timestamps
    end
  end
end
