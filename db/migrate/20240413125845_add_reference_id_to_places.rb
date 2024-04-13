class AddReferenceIdToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :ref, :integer
  end
end
