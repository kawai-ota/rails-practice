class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.text :name
      t.integer :age
      t.text :main

      t.timestamps
    end
  end
end
