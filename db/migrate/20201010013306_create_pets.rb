class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :image_url
      t.string :name
      t.string :approximate_age
      t.string :sex
      t.string :shelter_name
    end
  end
end
