module BadgesHelper
    def badge_goal_prompts
        { "BadgeGoals::DoubleProgressGoal" => "Double Your Progress",
          "BadgeGoals::WellRoundedGoal" => "You're Well Rounded"}
      end
    
      def badge_options_for_select
        badge_goal_prompts.collect { |k, v| [v, k] }
      end
end
