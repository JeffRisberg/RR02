class CreateActivityTracks < ActiveRecord::Migration
  def change
    create_table :activity_tracks do |t|
      t.references :activity, :null => false
      t.date :tracked_on, :null => false
      t.integer :amount, :null => false

      t.timestamps
    end
  end
end
