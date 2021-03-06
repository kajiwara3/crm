# coding: utf-8
class MailMagazine < ActiveRecord::Base
  has_many :magazine_targets, dependent: :destroy
  belongs_to :users
  attr_accessible :user_id, :subject, :body, :reserved_at, :sent_at, :canceled_at
  accepts_nested_attributes_for :magazine_targets, allow_destroy: true

  validates :subject, :body, :reserved_at, presence: true
  paginates_per 5

  scope :reserved_magazines, where('reserved_at <= ? and start_sending_at is null', Time.now)

  def set_start_sending_at
    self.start_sending_at = Time.current
    self.save
  end

  def set_complete_sending_at
    self.complete_sending_at = Time.now
    self.save
  end
end
