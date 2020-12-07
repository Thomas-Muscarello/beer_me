class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :malt
      t.string :malt_amount
      t.string :hop
      t.string :hop_amount
      t.string :yeast
      t.string :yeast_amount
      t.string :abv

      t.timestamps
    end
  end
end
