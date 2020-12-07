class ChangeAbvToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :beers, :abv, :decimal
  end
end
