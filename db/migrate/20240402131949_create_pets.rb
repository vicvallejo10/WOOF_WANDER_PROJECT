class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.date :birthdate
      t.string :microchip_number
      t.string :breed
      t.string :size
      t.string :color
      t.string :sterilized
      t.string :vaccine_card
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
