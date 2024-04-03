class AddPropertyTypeToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :place_type, :string
  end
end
