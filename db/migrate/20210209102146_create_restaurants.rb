class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :title
      t.string :details
      t.boolean :completed

      t.timestamps
    end
  end
end
