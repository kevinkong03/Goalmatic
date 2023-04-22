require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    user1 = User.create!(email: "tester@example.com", password: "password123", password_confirmation: "password123")
    study = Category.create(name: "study")
    @challenge = Challenge.create(name: "Study 8 hours a week", category: study, goal: 8, progress: 0, units: "hours", 
      ends_at: Date.parse("2023-12-31"), user: user1)
  end

  test "amount is positive" do
    activity = Activity.create(challenge: @challenge, amount: 0, note: "nothing", user_id: @challenge.user_id)
    assert activity.invalid?
    assert activity.errors[:amount].any?
  end
end
