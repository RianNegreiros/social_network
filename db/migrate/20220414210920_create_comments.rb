class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_keys: true
      t.references :post, foreign_keys: true
      t.string :body
      t.timestamps
    end
  end
end
