class Challenge < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :name, presence: true

  def activity_created(activity) 
    self.progress = self.progress + activity.amount
    self.save
  end

  def activity_deleted(activity)
    self.progress = self.progress - activity.amount
    self.save
  end
end
