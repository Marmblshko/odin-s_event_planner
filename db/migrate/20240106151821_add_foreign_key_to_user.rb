class AddForeignKeyToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :event
    add_reference :events, :creator
  end
end