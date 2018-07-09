class CreateTypeOfLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :type_of_letters do |t|
      t.string :name

      t.timestamps
    end
  end
end
