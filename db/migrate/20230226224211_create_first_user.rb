class CreateFirstUser < ActiveRecord::Migration[7.0]
  def change
    first_user = User.create(email: "firstuser@example.com", password: "changeme!", password_confirmation: "changeme!")

    Challenge.all.each do |challenge|
      challenge.user = first_user
      challenge.save
    end

    Activity.all.each do |activity|
      activity.user = first_user
      activity.save
    end
  end
end
