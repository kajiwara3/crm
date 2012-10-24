class MagazineTarget < ActiveRecord::Base
  belongs_to :mail_magazine
  paginates_per 5
end
