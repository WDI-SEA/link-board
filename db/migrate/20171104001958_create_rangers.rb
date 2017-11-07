class CreateRangers < ActiveRecord::Migration[5.1]
  def change
    create_table :rangers do |t|
      t.text :name

      t.timestamps
    end
  end
end
