class AddUserToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_reference :challenges, :user
  end
end
