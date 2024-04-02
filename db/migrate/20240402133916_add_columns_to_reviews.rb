class AddColumnsToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :description, :string
    add_column :reviews, :rating, :integer
  end
end
