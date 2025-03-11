class AddBreedToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :breed, :string
  end
end
