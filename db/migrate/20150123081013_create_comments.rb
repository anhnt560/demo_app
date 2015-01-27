class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :micropost, index: true
      t.references :user, index: true
      t.timestamps
    end
      add_index :comments, [:id]
      add_index :comments, [:user_id,:created_at]
  end
end
