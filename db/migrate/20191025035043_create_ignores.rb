class CreateIgnores < ActiveRecord::Migration[6.0]
  def change
    create_table :ignores do |t|
      t.integer :user_id
      t.integer :ignored_user

      t.timestamps
    end
  end
end
