class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.string :challenge_type
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end

    add_index :challenges, :challenge_type
  end
end
