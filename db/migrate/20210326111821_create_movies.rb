class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
    	t.string :title
    	t.datetime :releaseDate
    	t.integer :user_id
      t.timestamps
    end
  end
end
