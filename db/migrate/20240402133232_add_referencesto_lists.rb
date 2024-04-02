class AddReferencestoLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :lists, :place
  end
end
