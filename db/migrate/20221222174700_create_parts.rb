class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :role
      t.boolean :protective
      t.boolean :vulnerable
      t.text :description
      t.string :photo
      t.boolean :integrated

      t.timestamps
    end
  end
end
