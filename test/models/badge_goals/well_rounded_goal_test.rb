require "test_helper"

class WellRoundedGoalTest < ActiveSupport::TestCase

    setup do
        @well_rounded_badge = Badge.create!(name: "Well Rounded", description: "Well Rounded!", count: 3, goal_type: "BadgeGoals::WellRoundedGoal")
        @sleep = categories(:sleep)
        @study = categories(:study)
        @exercise =  categories(:exercise)
        @badge1 = Badge.create!(name: "Double Sleep", description: "Did double!", category: @sleep, count: 1, goal_type: "BadgeGoals::DoubleProgressGoal")
        @badge2 = Badge.create!(name: "Double Study", description: "Did double!", category: @study, count: 1, goal_type: "BadgeGoals::DoubleProgressGoal")
        @badge3 = Badge.create!(name: "Double Exercise", description: "Did double!", category: @exercise, count: 1, goal_type: "BadgeGoals::DoubleProgressGoal")
        @user = users(:one)
        @challenge = challenges(:sleep_40)
        @dummy_activity = Activity.create(note: "temp", amount: 2, challenge: @challenge, user: @user)
    end

    test "goal is achieved when badge awards are in 3 categories" do
        BadgeAward.create!(badge: @badge1, user: @user)
        BadgeAward.create!(badge: @badge2, user: @user)
        BadgeAward.create!(badge: @badge3, user: @user)
        @user.reload
        assert @well_rounded_badge.goal.achieved?(@dummy_activity)
    end

    test "goal is not achieved when badge awards are in less than 3 categories" do
        BadgeAward.create!(badge: @badge1, user: @user)
        @user.reload
        assert !@well_rounded_badge.goal.achieved?(@dummy_activity)
    end
end
    