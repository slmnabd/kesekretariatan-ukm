class CreateTypeOfMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :type_of_meetings do |t|
      t.string :name

      t.timestamps
    end
  end
end
