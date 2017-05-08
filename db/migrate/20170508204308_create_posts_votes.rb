class CreatePostsVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :posts_votes do |t|
      t.integer :post_id
      t.integer :author_id
      t.integer :value

      t.timestamps
    end
  end
end
