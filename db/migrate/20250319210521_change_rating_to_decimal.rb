class ChangeRatingToDecimal < ActiveRecord::Migration[8.0]
  def change
    change_column :reviews, :rating, :decimal, precision: 3, scale: 1
  end
end