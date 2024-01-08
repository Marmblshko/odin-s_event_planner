class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|

      t.timestamps
    end

    add_reference :attendances, :attendee
    add_reference :attendances, :event_attended
  end
end