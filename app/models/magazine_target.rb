class MagazineTarget < ActiveRecord::Base
  belongs_to :mail_magazine, dependent: :destroy
end
