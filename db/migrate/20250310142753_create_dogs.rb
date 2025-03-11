class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
