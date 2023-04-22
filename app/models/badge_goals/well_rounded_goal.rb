class BadgeGoals::WellRoundedGoal < BadgeGoal
    def achieved?(activity)
       activity.user.badges.collect(&:category_id).uniq.count >= badge.count
    end
end