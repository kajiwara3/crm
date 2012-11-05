class MagazineTarget < ActiveRecord::Base
  belongs_to :mail_magazine
  paginates_per 5
  validates :name, :email, presence: true

  scope :enabled_target, where('enabled_target = ? and sent_at is null', true)

  def set_sent_at
    self.sent_at = Time.now
    self.save
  end
end
