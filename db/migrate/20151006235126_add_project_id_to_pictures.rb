class AddProjectIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :project_id, :integer
  end
end
