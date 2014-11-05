# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

activity1 = Activity.create!(name: "Walking", limit: false, description: "Put on your shoes and walk!")
activity2 = Activity.create!(name: "Hiking", limit: false, description: "Get outside and enjoy it!")
activity3 = Activity.create!(name: "Push-ups", limit: false, description: "Like in the Army")
activity4 = Activity.create!(name: "Smoking", limit: true, description: "Try to cut down from a pack a day")
activity5 = Activity.create!(name: "Healthy Breakfast", limit: false, description: "Start your day right!")

challenge1 = Challenge.create!(
    name: "Fall hiking challenge", challenge_type: "SOLO", starts_at: Date.today - 1.day, ends_at: Date.today + 4.days
)
challenge2 = Challenge.create!(
    name: "Training drill", challenge_type: "TEAM", starts_at: Date.today - 5.days, ends_at: Date.today + 16.days
)
challenge3 = Challenge.create!(
    name: "Eat Healthy Challenge", challenge_type: "SOLO", starts_at: Date.today - 50.days, ends_at: Date.today - 10.days
)
challenge4 = Challenge.create!(
    name: " Holiday Challenge ", challenge_type: "SOLO", starts_at: Date.today + 5.days, ends_at: Date.today + 25.days
)

ChallengeActivity.create!(
    challenge: challenge1, activity: activity2, seq_num: 1,
    threshold_value: 1, threshold_kind: "DAILY", number_thresholds: 10, points_per_threshold: 5)
ChallengeActivity.create!(
    challenge: challenge2, activity: activity3, seq_num: 1,
    threshold_value: 3, threshold_kind: "DAILY", number_thresholds: 999, points_per_threshold: 10)
ChallengeActivity.create!(
    challenge: challenge3, activity: activity5, seq_num: 1,
    threshold_value: 5, threshold_kind: "DAILY", number_thresholds: 999, points_per_threshold: 1)
ChallengeActivity.create!(
    challenge: challenge3, activity: activity1, seq_num: 2,
    threshold_value: 1, threshold_kind: "DAILY", number_thresholds: 10, points_per_threshold: 1)
ChallengeActivity.create!(
    challenge: challenge4, activity: activity1, seq_num: 1,
    threshold_value: 1, threshold_kind: "WEEKLY", number_thresholds: 100, points_per_threshold: 10)
