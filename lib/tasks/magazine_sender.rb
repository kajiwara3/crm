# coding: utf-8
class Tasks::MagazineSender
  def self.execute
    @magazine_list = MailMagazine.reserved_magazines
    @magazine_list.each do |magazine|
      magazine.set_start_sending_at
      target_list = magazine.magazine_targets.enabled_target
      target_list.each do |target|
        MagazineMailer.magazine_sending(magazine, target.email).deliver
        target.set_sent_at
      end
      magazine.set_complete_sending_at
    end
  end
end