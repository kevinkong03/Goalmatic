require "test_helper"

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "challenge name is present" do
    challenge = Challenge.new()
    assert challenge.invalid?
    assert challenge.errors[:name].any?
  end

  test "after an activity is created, increase the challenge progress" do
    challenge = challenges(:sleep_40)
    activity = Activity.create(amount: 6, challenge: challenge, user_id: challenge.user_id)
    assert challenge.reload.progress == 14
  end

  test "after an activity is deleted, decrease the challenge progress" do
    challenge = challenges(:sleep_40)
    activity_to_destroy = Activity.create(note: "Went to bed late", amount: 6, challenge: challenge, user_id: challenge.user_id)
    activity_to_destroy.destroy
    assert challenge.reload.progress == 8
  end
end
