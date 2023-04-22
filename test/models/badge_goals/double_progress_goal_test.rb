require "test_helper"

class DoubleProgressGoalTest < ActiveSupport::TestCase
    setup do
        @double_progress_badge = Badge.create!(name: "Double Progress", description: "Did double!", category: categories(:sleep), count: 1, goal_type: "BadgeGoals::DoubleProgressGoal")
        @user = users(:one)
    end
    
    test "goal is achieved when progress of challenge is twice the goal" do
        challenge = challenges(:sleep_40)
        passing_activity = Activity.create(note: "slept 80 hours", amount: 80, challenge: challenge, user_id: challenge.user_id)
        passing_activity.reload
        assert @double_progress_badge.goal.achieved?(passing_activity)
    end

    test "goal is not achieved when progress of challenge is twice the goal" do
        challenge = challenges(:sleep_40)
        failing_activity = Activity.create(note: "slept 2 hours", amount: 2, challenge: challenge, user_id: challenge.user_id)
        failing_activity.reload
        assert !@double_progress_badge.goal.achieved?(failing_activity)
    end
    
end