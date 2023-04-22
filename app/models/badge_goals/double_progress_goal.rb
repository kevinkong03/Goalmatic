class BadgeGoals::DoubleProgressGoal < BadgeGoal
    def achieved?(activity)
        activity.challenge.progress >= (2 * activity.challenge.goal)
    end
end