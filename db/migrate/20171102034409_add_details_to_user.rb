class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :age, :integer
    add_column :users, :birthday, :date
    add_column :users, :phone, :string
  end
end
