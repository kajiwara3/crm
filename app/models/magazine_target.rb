class MagazineTarget < ActiveRecord::Base
  belongs_to :mail_magazine
  paginates_per 5
  validates :name, :email, presence: true
end
