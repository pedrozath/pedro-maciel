class AddEventIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :event_id, :integer
  end
end
