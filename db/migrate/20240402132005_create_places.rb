class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :place_name
      t.string :place_description
      t.string :place_type
      t.string :address
      t.string :city
      t.string :country
      t.string :zip_code
      t.float :longitude
      t.float :latitude
      t.boolean :tag_offleash
      t.boolean :tag_wateraccess
      t.boolean :tag_outdoor
      t.boolean :tag_indoor
      t.boolean :tag_smallpet
      t.boolean :tag_mediumpet
      t.boolean :tag_largepet
      t.boolean :tag_disposalstation

      t.timestamps
    end
  end
end
