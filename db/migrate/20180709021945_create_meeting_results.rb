class CreateMeetingResults < ActiveRecord::Migration[5.2]
  def change
    create_table :meeting_results do |t|
      t.integer :type_of_meeting_id
      t.datetime :date
      t.integer :activity_id
      t.text :result

      t.timestamps
    end
  end
end
