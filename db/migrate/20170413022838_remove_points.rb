class RemovePoints < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :points, :integer
  end
end
