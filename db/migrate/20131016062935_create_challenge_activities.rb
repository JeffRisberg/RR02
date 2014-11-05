class CreateChallengeActivities < ActiveRecord::Migration
  def change
    create_table :challenge_activities do |t|
      t.references :challenge
      t.references :activity
      t.integer :seq_num
      t.float :threshold_value
      t.string :threshold_kind
      t.integer :number_thresholds
      t.integer :points_per_threshold

      t.timestamps
    end
  end
end
