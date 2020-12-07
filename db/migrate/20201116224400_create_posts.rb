class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :beer_id
      t.string :text_area

      t.timestamps
    end
  end
end
