class AddProjectIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :project_id, :integer
  end
end
