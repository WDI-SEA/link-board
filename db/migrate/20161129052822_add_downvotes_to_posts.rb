class AddDownvotesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :downvotes, :integer, :default => 0
  end
end
