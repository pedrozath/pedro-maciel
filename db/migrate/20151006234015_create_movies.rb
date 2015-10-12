class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :file
      t.integer :project

      t.timestamps null: false
    end
  end
end
