class RemoveProjectFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :project, :string
  end
end
