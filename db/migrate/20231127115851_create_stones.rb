class CreateStones < ActiveRecord::Migration[6.1]
  def change
    create_table :stones do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.integer :start_time
      t.integer :end_time
      t.text :impression
      t.integer :user_id
      t.string :image
      t.integer :overall
      t.timestamps
    end
  end
end
