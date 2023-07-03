class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :instructions
      t.integer :minutes_to_read

      t.timestamps
    end
  end
end
