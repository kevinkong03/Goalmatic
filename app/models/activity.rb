class Activity < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  after_create :update_challenge_progress
  after_destroy :decrease_challenge_progress
  
  after_create :award_badges

  validates :amount, numericality: { greater_than_or_equal_to: 1 }

  def award_badges
    BadgeAwardService.award_badges(self)
  end

  def update_challenge_progress
    challenge.activity_created(self)
  end

  def decrease_challenge_progress
    challenge.activity_deleted(self)
  end
end