# coding: utf-8
class MailMagazine < ActiveRecord::Base
  has_many :magazine_targets, dependent: :destroy
  attr_accessible :subject, :body, :reserved_at, :sent_at, :canceled_at
  accepts_nested_attributes_for :magazine_targets, allow_destroy: true
end
