class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :author_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
