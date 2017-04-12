class AddPointsToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :points, :integer, default: 0
  end
end
