# coding: utf-8
class MailMagazine < ActiveRecord::Base
  has_many :magazine_targets, dependent: :destroy
  attr_accessible :subject, :body, :reserved_at, :sent_at, :canceled_at
end
