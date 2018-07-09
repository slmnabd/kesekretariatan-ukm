class CreateLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :letters do |t|
      t.integer :activity_id
      t.integer :type_of_letter_id
      t.string :description
      t.string :file

      t.timestamps
    end
  end
end
