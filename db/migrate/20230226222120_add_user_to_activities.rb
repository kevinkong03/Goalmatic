class AddUserToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :user
  end
end
