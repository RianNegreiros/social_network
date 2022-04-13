class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_keys: true
      t.references :post, foreign_keys: true
      t.timestamps
    end
  end
end
